-- 诊断图标
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "󰌶",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
        },
    },
})

-- lspkind（供 lsp/formatting.lua 使用，此处初始化一次）
local ok, lspkind = pcall(require, "lspkind")
if not ok then
    vim.notify("没有找到 lspkind", vim.log.levels.WARN)
    return
end

lspkind.init({
    mode = "symbol_text",
    preset = "codicons",
    symbol_map = {
        Text = "󰉿", Method = "", Function = "󰊕", Constructor = "",
        Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "󰒪",
        Module = "", Property = "󰜣", Unit = "", Value = "󰎠",
        Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
        File = "󰈙", Reference = "󰋺", Folder = "󰉋", EnumMember = "",
        Constant = "󰏿", Struct = "󰙅", Event = "", Operator = "󰆕",
        TypeParameter = "",
    },
})

-- lspsaga
local ok_saga, lspsaga = pcall(require, "lspsaga")
if not ok_saga then
    vim.notify("没有找到 lspsaga", vim.log.levels.WARN)
    return
end

lspsaga.setup({
    debug = false,
    -- 新版 lspsaga 用 diagnostic 子表
    diagnostic = {
        show_code_action = true,
        show_source = true,
        border_follow = true,
    },
    code_action = {
        num_shortcut = true,
        keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
    },
    finder = {
        keys = {
            open = "<CR>",
            vsplit = "s",
            split = "i",
            quit = "<ESC>",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },
        default = "ref+imp",
    },
    rename = {
        keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
        in_select = false,
    },
    lightbulb = { enable = false },
    symbol_in_winbar = { enable = false },
    outline = {
        win_position = "right",
        win_width = 30,
        preview_width = 0.4,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        auto_resize = false,
        keys = { expand_or_jump = "o", quit = "<F8>" },
    },
    ui = {
        title = true,
        border = "rounded",
        code_action = "",
    },
})
