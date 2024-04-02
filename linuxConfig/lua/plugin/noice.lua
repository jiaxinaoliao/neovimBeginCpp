local status, noice = pcall(require, 'noice')
if not status then
    vim.notify('没有找到 noice')
    return
end

require('notify').setup({
    background_colour = '#000000',
    render = "compact",--minimal default
    stages = "slide",
    timeout = 1000,
    minimum_width = 50,
})

require('noice').setup({
    lsp = {
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
        view = "cmdline_popup",
        format = {
            cmdline = { icon = '>' },
            search_down = { icon = '🔍⌄' },
            search_up = { icon = '🔍⌃' },
            filter = { icon = '$' },
            lua = { icon = '☾' },
            help = { icon = '?' },
        },
    },
    messages = {
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
    ---@type NoicePopupmenuItemKind|false
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
    },
})
