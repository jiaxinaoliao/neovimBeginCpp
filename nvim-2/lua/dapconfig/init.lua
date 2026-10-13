local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = "<module",
    virt_text_pos = "eol",
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil,
})

-- 高亮组
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapLogPoint",   { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapStopped",    { ctermbg = 0 })

-- 断点图标
local breakpoint_signs = {
    error = {
        text = "🛑", texthl = "DapBreakpoint",
        linehl = "DapBreakpoint", numhl = "DapBreakpoint",
    },
    condition = {
        text = "󰟃", texthl = "DapBreakpoint",
        linehl = "DapBreakpoint", numhl = "DapBreakpoint",
    },
    rejected = {
        text = "󰃤", texthl = "DapBreakpoint",   -- 修正：原为 DapBreakpint
        linehl = "DapBreakpoint", numhl = "DapBreakpoint",
    },
    logpoint = {
        text = "", texthl = "DapLogPoint",
        linehl = "DapLogPoint", numhl = "DapLogPoint",
    },
    stopped = {
        text = "󰜴", texthl = "DapStopped",
        linehl = "DapStopped", numhl = "DapStopped",
    },
}

vim.fn.sign_define("DapBreakpoint",          breakpoint_signs.error)
vim.fn.sign_define("DapBreakpointCondition", breakpoint_signs.condition)
vim.fn.sign_define("DapBreakpointRejected",  breakpoint_signs.rejected)
vim.fn.sign_define("DapLogPoint",            breakpoint_signs.logpoint)
vim.fn.sign_define("DapStopped",             breakpoint_signs.stopped)

-- dapui
dapui.setup({
    element_mappings = {
        scopes      = { edit = "e", repl = "r" },
        watches     = { edit = "e", repl = "r" },
        stacks      = { open = "g" },
        breakpoints = { open = "g", toggle = "b" },
    },
    layouts = {
        {
            elements = { "scopes", "stacks", "breakpoints", "watches" },
            size = 0.2,
            position = "left",
        },
        {
            elements = { "repl" },
            size = 0.25,
            position = "bottom",
        },
        {
            elements = { "console" },
            size = 0.2,
            position = "right",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "rounded",
        mappings = { close = { "q", "<Esc>" } },
    },
})

-- 事件监听
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    pcall(dapui.close)
end
dap.listeners.before.event_exited["dapui_config"] = function()
    pcall(dapui.close)
end

-- 加载具体语言配置
require("dapconfig.cpp")
require("dapconfig.python")
require("dapconfig.lua").setup()