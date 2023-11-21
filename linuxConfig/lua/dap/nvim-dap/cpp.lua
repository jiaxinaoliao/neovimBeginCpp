local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = "/home/jia/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    -- program = "${workspaceFolder}/a.out",
    program = function()
      return (vim.fn.getcwd() .. '\\' .. vim.fn.expand('%:r') .. '.out')
    end,

    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    externalConsole = false,
    MiMode = "gdb",
    -- miDebuggerPath = "/usr/bin/lldb",
  },
  -- {
  --   name = 'Attach to gdbserver :1234',
  --   type = 'cppdbg',
  --   request = 'launch',
  --   MIMode = 'gdb',
  --   miDebuggerServerAddress = 'localhost:1234',
  --   --miDebuggerPath = '/usr/bin/gdb',
  --   cwd = '${workspaceFolder}',
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  -- },
}

setupCommands = {  
  { 
     text = '-enable-pretty-printing',
     description =  'enable pretty printing',
     ignoreFailures = false 
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
