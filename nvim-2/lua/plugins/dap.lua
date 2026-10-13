return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<S-F5>",  function() require("keybindings")._dapTerminate() end, desc = "Terminate Debug" },
            { "<C-F5>",  function() require("dap").continue() end,              desc = "Continue" },
            { "<F6>",    function() require("dap").toggle_breakpoint() end,     desc = "Toggle Breakpoint" },
            { "<S-F6>",  function() require("dap").clear_breakpoints() end,     desc = "Clear Breakpoints" },
            { "<F7>",    function() require("dap").step_into() end,             desc = "Step Into" },
            { "<S-F7>",  function() require("dap").step_out() end,              desc = "Step Out" },
            { "<F10>",   function() require("dap").restart() end,               desc = "Restart" },
            { "<S-F10>", function() require("dap").terminate() end,             desc = "Terminate" },
            { "<F12>",   function() require("dap").step_over() end,             desc = "Step Over" },
            { "<S-F12>", function() require("dapui").eval() end,                desc = "Eval" },
        },
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            "nvim-telescope/telescope-dap.nvim",
        },
        config = function()
            require("dapconfig")

            vim.schedule(function()
                pcall(function()
                    require("telescope").load_extension("dap")
                end)
            end)
        end,
    },
}