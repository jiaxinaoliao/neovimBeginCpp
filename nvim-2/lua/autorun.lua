local function bufmap(bufnr, mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true })
end

-- 通用 helper：生成 "检测 include 目录" 的 PowerShell 片段
-- 返回形如：if (Get-Item ../include) { <src_cmd> -I ../include/ ... } elseif ...
local function include_aware(cmd_builder)
    local a = cmd_builder("-I ../include/")
    local b = cmd_builder("-I ./include/")
    local c = cmd_builder("")
    return string.format(
        [[if (Get-Item ../include) {%s} elseif(Get-Item ./include) {%s} else {%s}]],
        a, b, c
    )
end

-- ============================================================
-- 各语言的命令表
-- ============================================================
local langs = {
    -- C++
    cpp = {
        compiler = "g++",
        ext = "cpp",
        -- <Ca-l> 运行（TermExec 浮动窗口 + clear）
        run = include_aware(function(inc)
            return string.format([[%s %s *.cpp -o %%:t:r.exe ; clear ; ./%%:t:r.exe]], "g++", inc)
        end),
        -- <F5> 外部 pwsh 运行
        run_ext = include_aware(function(inc)
            return string.format([[%s %s *.cpp -o %%:t:r.exe ; clear ; ConsolePauser ./%%:t:r.exe]], "g++", inc)
        end),
        -- <F4> 仅编译
        build = include_aware(function(inc)
            return string.format([[%s %s *.cpp -o %%:t:r.exe ; exit]], "g++", inc)
        end),
        -- <C-F4> 调试编译
        build_dbg = include_aware(function(inc)
            return string.format([[%s -g %s *.cpp -o %%:t:r.exe ; exit]], "g++", inc)
        end),
        -- <S-F4> 带计时的运行
        run_timed = [[Get-Content a.txt | time ./%:t:r.exe > b.txt ; type b.txt]],
        -- 类名输入符
        var_name = "$myCppClassName",
    },

    -- C
    c = {
        compiler = "gcc",
        ext = "c",
        run = include_aware(function(inc)
            return string.format([[%s %s *.c -o %%:t:r.exe ; clear ; ./%%:t:r.exe]], "gcc", inc)
        end),
        run_ext = include_aware(function(inc)
            return string.format([[%s %s *.c -o %%:t:r.exe ; clear ; ConsolePauser ./%%:t:r.exe]], "gcc", inc)
        end),
        build = include_aware(function(inc)
            return string.format([[%s %s *.c -o %%:t:r.exe ; exit]], "gcc", inc)
        end),
        build_dbg = include_aware(function(inc)
            return string.format([[%s -g %s *.c -o %%:t:r.exe ; exit]], "gcc", inc)
        end),
        var_name = "$myCClassName",
    },

    -- Python
    python = {
        run = "python %",
        run_ext = 'ConsolePauser "python %"',
        var_name = "$myPythonName",
        ext = "py",
    },

    -- Lua
    lua = {
        run = "lua %",
        run_ext = 'ConsolePauser "lua %"',
    },

    -- Java
    java = {
        run = "javac %:t:r.java ; java %:t:r",
        run_ext = 'javac %:t:r.java ; ConsolePauser "java %:t:r"',
        build = "javac %:t:r.java",
    },

    -- Go
    go = {
        run = "go run %:t:r.go",
        run_ext = 'ConsolePauser "go run %:t:r.go"',
        build = "go build %:t:r.go",
    },

    -- Rust
    rust = {
        run = "rustc %:t:r.rs ; ./%:t:r.exe",
        run_ext = "rustc %:t:r.rs ; ConsolePauser %:t:r.exe",
        build = "rustc %:t:r.rs",
    },
}

-- ============================================================
-- 绑定循环
-- ============================================================
for ft, cfg in pairs(langs) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = function(args)
            local bufnr = args.buf

            -- <Ca-l> 运行（TermExec 浮动）
            if cfg.run then
                bufmap(bufnr, "n", "<Ca-l>",
                    string.format('<ESC>:w<CR>:TermExec direction=float cmd="%s"<CR>', cfg.run))
            end

            -- <F5> 外部窗口运行
            if cfg.run_ext then
                bufmap(bufnr, "n", "<F5>",
                    string.format('<ESC>:w<CR>:!start pwsh -nol -c "%s"<CR>', cfg.run_ext))
            end

            -- <F4> 仅编译
            if cfg.build then
                bufmap(bufnr, "n", "<F4>",
                    string.format('<ESC>:w<CR>:TermExec direction=float cmd="%s"<CR>', cfg.build))
            end

            -- <C-F4> 调试编译
            if cfg.build_dbg then
                bufmap(bufnr, "n", "<C-F4>",
                    string.format('<ESC>:w<CR>:TermExec direction=float cmd="%s"<CR>', cfg.build_dbg))
            end

            -- <S-F4> 计时运行（只 C/C++ 有）
            if cfg.run_timed then
                bufmap(bufnr, "n", "<S-F4>",
                    string.format('<ESC>:w<CR>:TermExec direction=float cmd="%s"<CR>', cfg.run_timed))
            end

            -- <CA-a> 新建单文件
            if cfg.var_name and cfg.ext then
                bufmap(bufnr, "n", "<CA-a>",
                    string.format(
                        '<ESC>:w<CR>:TermExec direction=float cmd="%s=Read-Host;New-Item .\\$%s.%s;exit"<CR>',
                        cfg.var_name, cfg.var_name, cfg.ext))
            end

            -- <CA-h> 新建头文件（C/C++）
            if cfg.var_name and (ft == "c" or ft == "cpp") then
                bufmap(bufnr, "n", "<CA-h>",
                    string.format(
                        '<ESC>:w<CR>:TermExec direction=float cmd="%s=Read-Host;'
                        .. 'if (Get-Item ../include) {cd ../include/;New-Item .\\$%s.h;cd ../src} '
                        .. 'elseif(Get-Item ./include) {cd ./include;New-Item .\\$%s.h;cd ..} '
                        .. 'else {New-Item .\\$%s.h};exit"<CR>',
                        cfg.var_name, cfg.var_name, cfg.var_name, cfg.var_name))
            end

            -- <CA-s>（C++）/ <CA-c>（C）新建源文件 + 头文件
            if cfg.var_name and (ft == "c" or ft == "cpp") then
                local src_ext = cfg.ext
                local lhs = (ft == "cpp") and "<CA-s>" or "<CA-c>"
                bufmap(bufnr, "n", lhs,
                    string.format(
                        '<ESC>:w<CR>:TermExec direction=float cmd="%s=Read-Host;'
                        .. 'if (Get-Item ../include) {New-Item .\\$%s.%s;cd ../include/;New-Item .\\$%s.h;cd ../src} '
                        .. 'elseif(Get-Item ./include) {New-Item .\\$%s.%s;cd ./include;New-Item .\\$%s.h;cd ..} '
                        .. 'else {New-Item .\\$%s.%s,.\\$%s.h};exit"<CR>',
                        cfg.var_name,
                        cfg.var_name, src_ext, cfg.var_name,
                        cfg.var_name, src_ext, cfg.var_name,
                        cfg.var_name, src_ext, cfg.var_name))
            end
        end,
    })
end
