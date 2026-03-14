local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end

lualine.setup({
    options = {
        -- 指定皮肤
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        event = "VeryLazy",
        theme = "auto",
        -- theme = "catppuccin",
        -- 分割线
        -- component_separators = '|',
        component_separators = {
            left = "|", --" or | or "
            right = "", --" or | or "
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            left = "", --"  or  or ",
            right = "", --" or  or ",
        },
        globalstatus = true,
    },
    extensions = { "nvim-tree" },
    sections = {
        lualine_a = {
            {
                "mode",
                separator = { left = "" },
                right_padding = 2,
            },
        },
        lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { "󰇊", "󰇋", "󰇌", "󰇍", "󰇎", "󰇏" },
            },
        },
        lualine_x = {
            "filesize",
            "encoding",
            {
                "fileformat",
                -- symbols = {
                -- 	unix = "", -- e712
                -- 	dos = "", -- e70f
                -- 	mac = "", -- e711
                -- },
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            "filetype",
        },
        lualine_z = {
            {
                "location",
                separator = { right = "" },
                left_padding = 2,
            },
        },
    },
})

-- vim.opt.laststatus = 0
