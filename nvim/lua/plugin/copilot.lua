local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    vim.notify("没有找到 copilot.lua")
    return
end

copilot.setup({
    -- 1. 建议面板配置 (以网格形式展示多个候选建议)
    panel = {
        enabled = true,
        auto_refresh = false,     -- 是否自动刷新建议
        keymap = {
            jump_prev = "[[",     -- 上一个建议
            jump_next = "]]",     -- 下一个建议
            accept = "<CR>",      -- 接受选中的建议
            refresh = "gr",       -- 手动刷新
            open = "<M-CR>"       -- 打开面板
        },
        layout = {
            position = "bottom",     -- 面板位置: top, left, right, bottom
            ratio = 0.4              -- 面板占窗口的比例
        },
    },
    -- 2. 内联建议配置 (幽灵文本)
    suggestion = {
        enabled = true,
        auto_trigger = true,         -- 自动触发建议
        keymap = {
            accept = "<M-l>",        -- 接受整个建议 (Alt+l)
            accept_word = false,     -- 逐词接受
            next = "<M-]>",          -- 下一个建议 (Alt+])
            prev = "<M-[>",          -- 上一个建议 (Alt+[)
            dismiss = "<C-]>",       -- 关闭当前建议 (Ctrl+])
        },
    },
    -- 3. 实验功能: NES (Next Edit Suggestions) 模式
    -- 需要额外安装 copilot-lsp 作为依赖
    nes = {
        enabled = false,
    },
})
