return {
    -- ============ Mason（LSP 安装器）============
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- ============ lspconfig + 语言 server 配置 ============
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
            "onsails/lspkind-nvim",
            { "glepnir/lspsaga.nvim", branch = "main" },
            { "j-hui/fidget.nvim", opts = {} },
            {
                "ray-x/lsp_signature.nvim",
                event = "InsertEnter",
                opts = {},
            },
        },
        config = function()
            -- 诊断图标
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                    },
                },
            })

            require("lsp.setup")
            require("lsp.ui")
        end,
    },

    -- ============ mason-lspconfig ============
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {}, -- 手动安装，这里留空
            automatic_installation = false,
        },
    },
    -- ============ formatter ============
    {
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatWrite" },
        config = function()
            require("lsp.formatter")
        end,
    },
}
