return {
    -- ============ Telescope ============
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<C-f>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
            { "<C-p>", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
            { "<C-b>", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
            { "<leader>F", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live Grep Args" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    initial_mode = "insert",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = { width = 0.98, prompt_position = "top", preview_cutoff = 1 },
                    mappings = require("keybindings").telescopeList,
                },
                pickers = {
                    find_files = { preview = true },
                    live_grep = { theme = "ivy", preview = true },
                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({}),
                },
            })
            pcall(telescope.load_extension, "live_grep_args")
            pcall(telescope.load_extension, "ui-select")
        end,
    },

    -- ============ Hop（跳转，覆盖原生 f/F/t/T）============
    {
        "smoka7/hop.nvim",
        keys = {
            { "<leader>w", "<cmd>HopWord<CR>", desc = "Hop Word" },
        },
        config = function()
            require("hop").setup()
            local hop = require("hop")
            local dir = require("hop.hint").HintDirection
            local map = vim.keymap.set
            map("n", "f", function() hop.hint_char1({ direction = dir.AFTER_CURSOR,  current_line_only = true }) end, { desc = "hop f" })
            map("n", "F", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = true }) end, { desc = "hop F" })
            map("o", "f", function() hop.hint_char1({ direction = dir.AFTER_CURSOR,  current_line_only = true, inclusive_jump = true }) end)
            map("o", "F", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true }) end)
            map("n",  "t", function() hop.hint_char1({ direction = dir.AFTER_CURSOR,  current_line_only = true }) end)
            map("n",  "T", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = true }) end)
        end,
    },

    -- ============ nvim-surround ============
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = { mappings_style = "nvim-surround" },
    },

    -- ============ Comment.nvim ============
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup(require("keybindings").comment)
        end,
    },

    -- ============ nvim-autopairs ============
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        opts = {
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        },
        config = function(_, opts)
            local npairs = require("nvim-autopairs")
            npairs.setup(opts)
            -- cmp 集成
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end,
    },

    -- ============ gitsigns ============
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "A|" },
                    change = { text = "C|" },
                    delete = { text = "D_" },
                    topdelete = { text = "D‾" },
                    changedelete = { text = "D~" },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = true,
                watch_gitdir = { interval = 1000, follow_files = true },
                attach_to_untracked = true,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 1000,
                    ignore_whitespace = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                max_file_length = 40000,
                preview_config = {
                    border = "single", style = "minimal",
                    relative = "cursor", row = 0, col = 1,
                },
                on_attach = function(bufnr)
                    local gs = require("gitsigns")
                    for _, m in ipairs(require("keybindings").gitsigns) do
                        local mode, lhs, rhs, opts = m[1], m[2], m[3], m[4] or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end
                    -- 补上独立字段引用
                    local function bmap(mode, l, r)
                        vim.keymap.set(mode, l, r, { buffer = bufnr })
                    end
                    bmap("n", "<leader>gS", gs.stage_buffer)
                    bmap("n", "<leader>gu", gs.undo_stage_hunk)
                    bmap("n", "<leader>gR", gs.reset_buffer)
                    bmap("n", "<leader>gp", gs.preview_hunk)
                    bmap("n", "<leader>gb", function() gs.blame_line({ full = true }) end)
                    bmap("n", "<leader>gd", gs.diffthis)
                    bmap("n", "<leader>gD", function() gs.diffthis("~") end)
                    bmap("n", "<leader>gtd", gs.toggle_deleted)
                    bmap("n", "<leader>gtb", gs.toggle_current_line_blame)
                end,
            })
        end,
    },

    -- ============ toggleterm ============
    {
        "akinsho/toggleterm.nvim",
        keys = {
    { "tt", desc = "Toggle Float" },
    { "tb", desc = "Toggle Vertical" },
    { "tc", desc = "Toggle Horizontal" },
    { "tg", desc = "Toggle Lazygit" },
        },
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 10
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.3
                    end
                end,
                shell = "pwsh -nologo",
                start_in_insert = true,
            })

            local Terminal = require("toggleterm.terminal").Terminal

            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir",
                direction = "float",
                float_opts = { border = "double" },
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                end,
            })

            local ta = Terminal:new({ direction = "float",     close_on_exit = true })
            local tb = Terminal:new({ direction = "vertical",  close_on_exit = true })
            local tc = Terminal:new({ direction = "horizontal", close_on_exit = true })

            local function toggle(self, others)
                if self:is_open() then
                    self:close()
                    return
                end
                for _, o in ipairs(others) do o:close() end
                self:open()
            end

            vim.keymap.set({ "n", "t" }, "tt", function() toggle(ta, { tb, tc }) end, { desc = "Toggle Float" })
            vim.keymap.set({ "n", "t" }, "tb", function() toggle(tb, { ta, tc }) end, { desc = "Toggle Vertical" })
            vim.keymap.set({ "n", "t" }, "tc", function() toggle(tc, { ta, tb }) end, { desc = "Toggle Horizontal" })
            vim.keymap.set({ "n", "t" }, "tg", function() lazygit:toggle() end, { desc = "Toggle Lazygit" })
        end,
    },

    -- ============ neoscroll ============
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {
            mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", "gg" },
            hide_cursor = true,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            duration_multiplier = 1.0,
            easing = "linear",
            performance_mode = false,
            ignored_events = { "WinScrolled", "CursorMoved" },
        },
    },

    -- ============ Trans（翻译）============
    {
        "JuanZoran/Trans.nvim",
        keys = {
            { "<leader>fy", "<cmd>Translate<CR>", desc = "Translate" },
        },
        dependencies = { "kkharji/sqlite.lua" },
        build = function() require("Trans").install() end,
        config = function()
            require("Trans").setup({
                opts = {
                    frontend = {
                        hover = {
                            keymaps = {
                                pageup = "<C-u>",
                                pagedown = "<C-d>",
                                pin = "<leader>[",
                                close = "<leader>]",
                                toggle_entry = "<leader>;",
                            },
                        },
                    },
                },
            })
        end,
    },
}
