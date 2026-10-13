return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c", "cpp", "c_sharp", "cmake", "java", "python",
                    "json", "html", "css", "vim", "lua", "markdown",
                    "javascript", "typescript",
                },
                auto_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "<TAB>",
                    },
                },
                indent = {
                    enable = true,
                    disable = { "c", "cpp" },
                },
            })
        end,
    },

    -- 彩虹括号
    {
        "hiphish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("rainbow-delimiters.setup").setup({
                strategy = {
                    [""] = require("rainbow-delimiters").strategy["global"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-delimiters",
                    python = "rainbow-delimiters",
                },
                highlight = {
                    "RainbowDelimiterRed", "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue", "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen", "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            })
        end,
    },
}
