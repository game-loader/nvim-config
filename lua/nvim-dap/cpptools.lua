-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)

local dap = require("dap")

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/Users/logicluo/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',

}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    -- 根据系统需要修改
    MIMode = 'lldb',
    -- miDebuggerServerAddress = 'localhost:1234',
    -- miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
