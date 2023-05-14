-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
require("plugin.transparent")
-- 插件配置
require("plugin.impatient")
--require("plugin.neo-tree")
require("plugin.nvim-tree")
require("plugin.bufferline")
require("plugin.lualine")
require("plugin.telescope")
require("plugin.dashboard")
require("plugin.gitsigns")
require("plugin.nvim-treesitter")
require("plugin.indent-blankline")
require("plugin.toggleterm")
require("plugin.surround")
require("plugin.comment")
require("plugin.nvim-autopairs")
require("plugin.noice")
require("plugin.hop")
require("plugin.which-key")
require("plugin.flit")
require("plugin.symbols")
require("plugin.smoothcursor")
--require("plugin.lf")
--require("plugin.fidget")
--require("plugin.leap")
--require("plugin.sniprun")
--require("plugin.project")
--require("plugin.nvim-cmake")
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
