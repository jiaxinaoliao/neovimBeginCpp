local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'D:\\CppApp\\neovim\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd',
  options = {
    detached = false
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\' .. vim.fn.expand('%:r') .. '.exe', 'file')
    -- end,
    program = function()
      return (vim.fn.getcwd() .. '\\' .. vim.fn.expand('%:r') .. '.exe')
    end,
    -- program = '${workspaceFolder}'
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    externalConsole = false,
    MIMode = "gdb",
    -- miDebuggerPath = "D:\\CppApp\\llvm-mingw\\bin\\lldb.exe",
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
