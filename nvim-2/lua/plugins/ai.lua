return {
    -- ============ minuet-ai（DeepSeek 补全）============
    {
        "milanglacier/minuet-ai.nvim",
        event = "InsertEnter",
        opts = {
            virtualtext = {
                auto_trigger_ft = { "cpp", "lua", "python" },
                keymap = {
                    accept = "<A-l>",
                    accept_line = "<A-a>",
                    accept_n_lines = "<A-z>",
                    prev = "<A-[>",
                    next = "<A-]>",
                    dismiss = "<A-e>",
                },
            },
            provider = "openai_fim_compatible",
            provider_options = {
                openai_fim_compatible = {
                    api_key = "DEEPSEEK_API_KEY", 
                    name = "deepseek",
                    end_point = "https://api.deepseek.com/beta/completions",
                    model = "deepseek-chat",
                    optional = {
                        max_tokens = 256,
                        top_p = 0.9,
                    },
                },
            },
        },
    },

    -- ============ copilot.lua（GitHub Copilot）============
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     opts = {
    --         panel = {
    --             enabled = true,
    --             auto_refresh = false,
    --             keymap = {
    --                 jump_prev = "[[",
    --                 jump_next = "]]",
    --                 accept = "<CR>",
    --                 refresh = "gr",
    --                 open = "<M-CR>",
    --             },
    --             layout = { position = "bottom", ratio = 0.4 },
    --         },
    --         suggestion = {
    --             enabled = true,
    --             auto_trigger = true,
    --             keymap = {
    --                 accept = "<C-l>",
    --                 accept_word = false,
    --                 next = "<M-]>",
    --                 prev = "<M-[>",
    --                 dismiss = "<C-]>",
    --             },
    --         },
    --         nes = { enabled = false },
    --     },
    -- },
}