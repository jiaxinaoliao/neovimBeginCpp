-- leader 按键
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- 1 基础选项
require("basic")

-- 2 快捷键
require("keybindings")

-- 3 自动命令
require("autorun")

-- 4 插件管理
require("plugins")

-- 5 Neovide 专属设置
require("config.neovide")

-- 6 复制到 Windows 剪贴板修复
-- require("config.fix-yank")

