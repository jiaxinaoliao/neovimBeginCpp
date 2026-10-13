local dap = require("dap")

-- 可以用环境变量覆盖，默认交给 PATH
local MI_DEBUGGER = vim.env.MI_DEBUGGER_PATH or nil

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "OpenDebugAD7",       -- 原来是绝对路径，改成 PATH
    options = { detached = false },
}

local cpp_config = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.getcwd() .. "\\" .. vim.fn.expand("%:r") .. ".exe"
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        externalConsole = false,
        MIMode = "gdb",
        miDebuggerPath = MI_DEBUGGER,
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}

dap.configurations.cpp  = cpp_config
dap.configurations.c    = cpp_config
dap.configurations.rust = cpp_config