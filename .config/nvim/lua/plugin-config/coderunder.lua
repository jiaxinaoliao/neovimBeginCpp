require"CodeRunner".setup {
    -- 你可以在此处自定义不同语言的执行方式
    tasks = {
        c = "make",-- 可以是字符串，会发送到浮动终端执行
        cpp = function()
            vim.cmd("g++ %")
        end,
        python = "python <file>", -- 尖括号标记预定义变量。见下方变量。
        lua = function() -- 也可以执行一个函数
            vim.cmd("luafile %") -- 使用 VIM API
        end,
    },
    -- 此处可自定义浮动终端样式
    style = {
        -- 边框，见 `:help nvim_open_win`
        border = "rounded", -- 圆角边框
        -- 终端背景色
        bgcolor = "NONE", -- NONE 为透明
        -- 终端大小和位置，为百分数相对位置
        layout = {
            width = .8, -- 80% 编辑器大小
            height = .8,
            x = .5, -- 在编辑器中间
            y = .5
        }
    }
}
