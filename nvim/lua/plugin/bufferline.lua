local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
    return
end

-- bfferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- always_show_bufferline = false,
        numbers = "ordinal",

        -- 关闭 Tab 的命令
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",

        hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
        },
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and "" or (e == "warning" and "" or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})

vim.opt.showtabline = 0
-- -- 先后顺序
-- -- 隐藏
local has_executed = false
local delay_ms = 0 -- 延时毫秒数，可调整

local function cleanup()
    -- 安全删除 autocmd 组（使用 pcall 避免组不存在时报错）
    pcall(vim.api.nvim_del_augroup_by_name, "SecondBufferOnce")
    -- 删除函数引用
    handle_second_buffer_opened = nil
    has_executed = true
    -- print("已清理 SecondBufferOnce 相关资源")
end

local function handle_second_buffer_opened()
    if has_executed then
        -- print("已执行过，跳过")
        return
    end

    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local buffer_count = #buffers

    if buffer_count == 2 then
        -- print("检测到第二个 buffer 已打开，将在 " .. delay_ms .. " 毫秒后执行切换命令")
        -- 延迟执行命令
        vim.defer_fn(function()
            vim.cmd("let &showtabline = (&showtabline == 2 ? 0 : 2)")
            -- print("已执行切换命令")

            -- 执行清理
            cleanup()

            -- 延迟 1ms 后再次执行切换命令
            vim.defer_fn(function()
                vim.cmd("let &showtabline = (&showtabline == 2 ? 0 : 2)")
                -- print("1ms 后再次执行切换命令")
            end, 1)
        end, delay_ms)
    end
end

local group = vim.api.nvim_create_augroup("SecondBufferOnce", { clear = true })
vim.api.nvim_create_autocmd("BufAdd", {
    group = group,
    callback = handle_second_buffer_opened,
})

-- 可选：添加一个手动清理的命令
vim.api.nvim_create_user_command("CleanupSecondBuffer", cleanup, {})
