-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 1
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
--vim.wo.colorcolumn = "80"
vim.opt.history = 200
-- 缩进2个空格等于一个Tab
vim.opt.tabstop = 4
vim.bo.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
-- >> << 时移动长度
vim.opt.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.opt.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.opt.autoindent = true
vim.bo.autoindent = true
vim.opt.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索不要高亮
vim.opt.hlsearch = true
-- 边输入边搜索
vim.opt.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = true
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.opt.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.opt.hidden = true
-- 鼠标支持
vim.opt.mouse = "a"
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- smaller updatetime
vim.opt.updatetime = 200
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.opt.timeoutlen = 200
-- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.opt.termguicolors = true
vim.opt.termguicolors = true
-- 是否显示不可见字符
vim.opt.list = true
-- 不可见字符的显示，这里只把空格显示为一个点
--vim.o.listchars = "space:·,tab:··"
-- 补全增强
vim.opt.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.opt.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
vim.opt.pumheight = 6
-- 永远显示 tabline 2 0 1  bufferline中
-- vim.opt.showtabline = 0
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false
-- 配置剪切板
vim.opt.clipboard = "unnamedplus"
-- 自动跳转文件目录
vim.opt.autochdir = true
vim.opt.nrformats = "bin,hex,alpha"
