return {
    -- ============ 多光标 ============
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
    },

    -- ============ 细胞自动机（娱乐）============
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton" },
        keys = {
            { "cam", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it Rain" },
            { "cag", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
        },
    },

    -- ============ 平滑光标 ============
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        opts = {
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = false,
            smear_insert_mode = true,
            stiffness = 1,
            trailing_stiffness = 1,
            distance_stop_animating = 1,
        },
    },

    -- ============ 十六进制编辑 ============
    {
        "RaafatTurki/hex.nvim",
        cmd = { "HexDump", "HexAssemble", "HexToggle" },
        opts = {
            dump_cmd = "xxd",
            assemble_cmd = "xxd -r",
            is_buf_binary_pre_read = function() return true end,
            is_buf_binary_post_read = function() return true end,
        },
    },

    -- ============ project ============
    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            detection_methods = { "pattern" },
            patterns = {
                "README.md", "Cargo.toml", "package.json", ".sln",
                ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile",
            },
        },
        config = function(_, opts)
            require("project_nvim").setup(opts)
            vim.schedule(function()
                pcall(function()
                    require("telescope").load_extension("projects")
                end)
            end)
        end,
    },

    -- ============ cmake-tools ============
    {
        "Civitasv/cmake-tools.nvim",
        ft = "cmake",
        cmd = {
            "CMakeGenerate", "CMakeBuild", "CMakeRun",
            "CMakeDebug", "CMakeSelectBuildType", "CMakeSelectTarget",
        },
        opts = function()
            local osys = require("cmake-tools.osys")
            return {
                cmake_command = "cmake",
                ctest_command = "ctest",
                cmake_use_preset = true,
                cmake_regenerate_on_save = true,
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
                cmake_build_options = {},
                cmake_build_directory = function()
                    if osys.iswin32 then
                        return "out\\${variant:buildType}"
                    end
                    return "out/${variant:buildType}"
                end,
                cmake_compile_commands_options = {
                    action = "soft_link",
                    target = (vim.uv or vim.loop).cwd(),
                },
                cmake_kits_path = nil,
                cmake_variants_message = {
                    short = { show = true },
                    long = { show = true, max_length = 40 },
                },
                cmake_dap_configuration = {
                    name = "cpp", type = "codelldb", request = "launch",
                    stopOnEntry = false, runInTerminal = true,
                    console = "integratedTerminal",
                },
                cmake_executor = {
                    name = "quickfix",
                    opts = {},
                    default_opts = {
                        quickfix = {
                            show = "always", position = "belowright", size = 10,
                            encoding = "utf-8", auto_close_when_success = true,
                        },
                    },
                },
                cmake_runner = {
                    name = "terminal",
                    opts = {},
                    default_opts = {
                        terminal = {
                            name = "Main Terminal",
                            prefix_name = "[CMakeTools]: ",
                            split_direction = "horizontal",
                            split_size = 11,
                            single_terminal_per_instance = true,
                            single_terminal_per_tab = true,
                            keep_terminal_static_location = true,
                            auto_resize = true,
                            start_insert = false,
                            focus = false,
                            do_not_add_newline = false,
                        },
                    },
                },
                cmake_notifications = {
                    runner = { enabled = true },
                    executor = { enabled = true },
                    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                    refresh_rate_ms = 100,
                },
                cmake_virtual_text_support = true,
                cmake_use_scratch_buffer = false,
            }
        end,
        keys = {
            { "<leader>cg", "<cmd>CMakeGenerate<CR>",        desc = "CMake Generate" },
            { "<leader>cb", "<cmd>CMakeBuild<CR>",           desc = "CMake Build" },
            { "<leader>cr", "<cmd>CMakeRun<CR>",             desc = "CMake Run" },
            { "<leader>cd", "<cmd>CMakeDebug<CR>",           desc = "CMake Debug" },
            { "<leader>ct", "<cmd>CMakeSelectTarget<CR>",    desc = "Select Target" },
            { "<leader>cT", "<cmd>CMakeSelectBuildType<CR>", desc = "Select Build Type" },
        },
    },
}