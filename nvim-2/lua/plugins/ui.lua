return {
    -- 图标（被多个插件依赖）
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "echasnovski/mini.nvim", version = false, lazy = true },

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
        keys = {
            { "<A-m>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            local function on_attach(bufnr)
                local api = require("nvim-tree.api")
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr,
                             noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.set("n", "n", api.tree.change_root_to_node, opts("CD"))
                vim.keymap.set("n", "I", api.node.show_info_popup, opts("Info"))
                vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
                vim.keymap.set("n", "<C-n>", api.node.open.tab, opts("Open: New Tab"))
                vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
                vim.keymap.set("n", "b", api.node.open.horizontal, opts("Open: Horizontal Split"))
                vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
                vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
                vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
                vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
                vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
                vim.keymap.set("n", "N", api.tree.change_root_to_parent, opts("Up"))
                vim.keymap.set("n", "a", api.fs.create, opts("Create"))
                vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
                vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
                vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
                vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
                vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
                vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
                vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
                vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
                vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
                vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
                vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
                vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
                vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
                vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
                vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
                vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
                vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
                vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
                vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
                vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
                vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
                vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
                vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
                vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
                vim.keymap.set("n", "q", api.tree.close, opts("Close"))
                vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
                vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
                vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
                vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
                vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
                vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
                vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
                vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
                vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
                vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
            end

            require("nvim-tree").setup({
                on_attach = on_attach,
                disable_netrw = true,
                git = { enable = true },
                update_focused_file = { enable = true, update_root = true },
                view = {
                    width = 20,
                    side = "left",
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                    float = { enable = false },
                    cursorline = false,
                },
                actions = {
                    open_file = { resize_window = true, quit_on_open = true },
                    file_popup = { open_win_config = { border = "rounded" } },
                },
            })
        end,
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<A-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
            { "<A-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
            { "<leader>xh", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left" },
            { "<leader>xl", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right" },
            { "<leader>xo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close Others" },
            { "<leader>xp", "<cmd>BufferLinePickClose<CR>", desc = "Pick Close" },
        },
        opts = {
            options = {
                numbers = "ordinal",
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                hover = { enabled = true, delay = 200, reveal = { "close" } },
                offsets = {
                    { filetype = "NvimTree", text = "File Explorer",
                      highlight = "Directory", text_align = "left" },
                },
                diagnostics = true,
                diagnostics_indicator = function(count, level)
                    local s = " "
                    local d = { error = "", warning = "", information = "" }
                    return s .. count .. (d[level] or "")
                end,
            },
        },
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "arkav/lualine-lsp-progress" },
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                component_separators = { left = "|", right = "" },
                section_separators = { left = "", right = "" },
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

        },
    },

    -- notify
    {
        "rcarriga/nvim-notify",
        opts = {
            stages = "fade_in_slide_out",
            render = "default",
            timeout = 3000,
            background_colour = "#000000",
            minimum_width = 50,
            icons = {
                ERROR = "", WARN = "", INFO = "", DEBUG = "", TRACE = "✎",
            },
        },
    },

    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            cmdline = {
                enabled = true,
                format = {
                    cmdline = { icon = ">" },
                    search_down = { icon = "⌄" },
                    search_up = { icon = "⌃" },
                    filter = { icon = "$" },
                    lua = { icon = "☾" },
                    help = { icon = "?" },
                },
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
            popupmenu = { enabled = true, backend = "nui", kind_icons = {} },
        },
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>C", "<cmd>%bd|e#<CR>", desc = "Close Other Buffers" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
                { "<leader>d", group = "Debug" },
                { "<leader>x", group = "Close" },
            },
        },
    },

    -- dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    footer = {
                        "",
                        "",
                        " https://github.com/jiaxinaoliao",
                    },
                    center = {
                        {
                            icon = "󰈞  ",
                            icon_hl = "Title",
                            desc = "Find file        ",
                            desc_hl = "String",
                            action = "Telescope find_files",
                        },
                        {
                            icon = "󰌌  ",
                            icon_hl = "Title",
                            desc = "Edit keybindings ",
                            desc_hl = "String",
                            action = "edit " .. vim.fn.stdpath("config") .. "/lua/keybindings.lua",
                        },
                        {
                            icon = "󰒓  ",
                            icon_hl = "Title",
                            desc = "Edit PowerShell  ",
                            desc_hl = "String",
                            action = "edit D:/UsersData/Documents/PowerShell/Microsoft.PowerShell_profile.ps1",
                        },
                        {
                            icon = "  ",
                            icon_hl = "Title",
                            desc = "Edit init.lua    ",
                            desc_hl = "String",
                            action = "edit " .. vim.fn.stdpath("config") .. "/init.lua",
                        },
                    },
                    header = {
                        [[]],
                        [[                                               ]],
                        [[        ██╗██╗ █████╗        █████╗  ██████╗   ]],
                        [[        ██║██║██╔══██╗      ██╔══██╗██╔═══██╗  ]],
                        [[        ██║██║███████║      ███████║██║   ██║  ]],
                        [[   ██   ██║██║██╔══██║      ██╔══██║██║   ██║  ]],
                        [[   ╚█████╔╝██║██║  ██║      ██║  ██║╚██████╔╝  ]],
                        [[    ╚════╝ ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝ ╚═════╝   ]],
                        [[                                               ]],
                        [[                                               ]],
                        [[               [ version : 5.2.1 ]             ]],
                        [[]],
                        [[]],
                    },
                },
            })

        end,
    },
            
    -- indent-blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            return {
                indent = { highlight = {
                    "RainbowRed", "RainbowYellow", "RainbowBlue", "RainbowOrange",
                    "RainbowGreen", "RainbowViolet", "RainbowCyan",
                }},
                exclude = {
                    filetypes = {
                        "lspinfo", "lazy", "checkhealth", "help", "man",
                        "gitcommit", "dashboard", "TelescopePrompt", "TelescopeResults",
                    },
                    buftypes = { "nofile", "terminal", "quickfix", "prompt" },
                },
            }
        end,
    },

    -- 颜色高亮
    {
        "brenoprata10/nvim-highlight-colors",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            render = "virtual",
            virtual_symbol = "■",
            virtual_symbol_position = "inline",
            enable_hex = true,
            enable_short_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_var_usage = true,
            enable_named_colors = true,
            enable_tailwind = false,
        },
    },
}
