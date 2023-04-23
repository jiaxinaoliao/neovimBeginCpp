-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
--require('config.colorscheme')
--require('plugin.transparent')
require("plugin.catppuccin")
-- 自动命令
--require("autocmds")
-- 插件配置
require("plugin.nvim-tree")
require("plugin.bufferline")
require("plugin.lualine")
require("plugin.telescope")
require("plugin.dashboard")
--require("plugin.project")
require("plugin.nvim-treesitter")
require("plugin.indent-blankline")
require("plugin.toggleterm")
require("plugin.surround")
require("plugin.comment")
require("plugin.nvim-autopairs")
require("plugin.impatient")
require("plugin.noice")
require("plugin.sniprun")
require("plugin.hop")
require("plugin.which-key")
require("plugin.flit")
require("plugin.lf")
-- 内置LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
-- 格式化
require("lsp.formatter")
-- DAP
require("dap.nvim-dap")
-- 复制到windows剪贴板
require("config.fix-yank")
