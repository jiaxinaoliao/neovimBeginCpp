-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer插件管理
require('plugins')
-- 主题设置
-- require('colorscheme')
require('plugin-config.catppuccin')
-- 自动命令
--require("autocmds")
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
--require("plugin-config.project")
require('plugin-config.nvim-treesitter')
require('plugin-config.indent-blankline')
require('plugin-config.toggleterm')
require('plugin-config.surround')
require('plugin-config.comment')
require('plugin-config.nvim-autopairs')
--require('plugin-config.fidget')
require('plugin-config.impatient')
require('plugin-config.nvim-notify')
require('plugin-config.popup')
require('plugin-config.neotest')
require('plugin-config.sniprun')
require('plugin-config.nvim-cmake')
require('plugin-config.hop')
require('plugin-config.which-key')
require('plugin-config.transparent')
-- 内置LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
-- 格式化
require('lsp.formatter')
--require('lsp.null-ls')
--一键运行
--require('plugin-config.coderunder')
-- DAP
require('dap.vimspector')
--require('dap.nvim-dap')
-- utils
-- 复制到windows剪贴板
require('utils.fix-yank')
