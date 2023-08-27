-- 自动安装 Lazy.nvim
-- 插件安装目录
-- ~/user/.Appdate/local/nvim-data/lazy/
local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.notify('正在安装Lazy.nvim，请稍后...')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  local rtp_addition = vim.fn.stdpath('data') .. '/lazy/*'
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
  end
  vim.notify('Lazy.nvim 安装完毕')
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  vim.notify('没有安装 lazy.nvim')
  return
end

lazy.setup({
  -- Packer 可以升级自己
  --"wbthomason/packer.nvim",
  -- 加速lua
  "lewis6991/impatient.nvim",
  ------------- 基础插件------------------
  -- 基本api
  "nvim-lua/plenary.nvim",
  -- 弹窗窗口
  "rcarriga/nvim-notify",
  "MunifTanjim/nui.nvim",
  "folke/noice.nvim",
  -- nvim-tree
  "nvim-tree/nvim-tree.lua",
  -- "nvim-neo-tree/neo-tree.nvim",
  "nvim-tree/nvim-web-devicons",
  -- "preservim/tagbar",
  -- "simrat39/symbols-outline.nvim",
  -- bufferline
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  -- lualine
  "nvim-lualine/lualine.nvim",
  "arkav/lualine-lsp-progress",
  -- 多光标
  "mg979/vim-visual-multi",
  -- telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-live-grep-args.nvim",
  "nvim-telescope/telescope-live-grep-raw.nvim",
  "LinArcX/telescope-env.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-rg.nvim",
  "nvim-telescope/telescope-dap.nvim",
  -- markdown preview
  "iamcco/markdown-preview.nvim",
  -- 跳转插件
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",
  -- 单词跳转
  "phaazon/hop.nvim",
  -- dashboard-nvim
  "glepnir/dashboard-nvim",
  -- project
  -- "ahmedkhalf/project.nvim",
  --语法高亮
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  -- indent-blankline
  "lukas-reineke/indent-blankline.nvim",
  --------------------- LSP --------------------
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- Lspconfig
  "neovim/nvim-lspconfig",
  "ray-x/lsp_signature.nvim",
  -- cmake
  "Shatur/neovim-cmake",
  -- 补全引擎
  "hrsh7th/nvim-cmp",
  -- 补全源
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",                -- { name = nvim_lsp }
  "hrsh7th/cmp-buffer",                  -- { name = 'buffer' },
  "hrsh7th/cmp-path",                    -- { name = 'path' }
  "hrsh7th/cmp-cmdline",                 -- { name = 'cmdline' }
  "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
  -- 常见编程语言代码段
  "rafamadriz/friendly-snippets",
  -- UI 增强
  "onsails/lspkind-nvim",
  "glepnir/lspsaga.nvim",
  -- 代码格式化
  "mhartington/formatter.nvim",
  -- "jose-elias-alvarez/null-ls.nvim",
  -- "nvim-lua/plenary.nvim",
  -- TypeScript 增强
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "nvim-lua/plenary.nvim",
  -- Lua 增强
  "folke/neodev.nvim",
  -- JSON 增强
  "b0o/schemastore.nvim",
  -- Rust 增强
  "simrat39/rust-tools.nvim",
  --------------------- colorschemes --------------------
  -- tokyonight
  "folke/tokyonight.nvim",
  -- OceanicNext
  --"mhartington/oceanic-next",
  -- gruvbox
  "ellisonleao/gruvbox.nvim",
  -- zephyr
  --"glepnir/zephyr-nvim",
  -- nord
  --"shaunsingh/nord.nvim",
  -- onedark
  "navarasu/onedark.nvim",
  -- nightfox
  -- "EdenEast/nightfox.nvim",
  -- vscode
  "Mofiqul/vscode.nvim",
  -- catppuccin
  "catppuccin/nvim",
  --主题透明
  "xiyaowong/transparent.nvim",
  --纯净模式
  "Pocco81/true-zen.nvim",
  --不同位置的终端
  "akinsho/toggleterm.nvim",
  --关键字
  "folke/which-key.nvim",
  -- surround
  "kylechui/nvim-surround",
  -- Comment
  "numToStr/Comment.nvim",
  -- nvim-autopairs括号补全
  "windwp/nvim-autopairs",
  -- git
  "lewis6991/gitsigns.nvim",
  ---------------------------dap调试--------------
  -- vimspector
  -- "puremourning/vimspector",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  -------------lf插件----------
  -- "ptzz/lf.vim",
  -- "voldikss/vim-floaterm",
  -----翻译插件
  "voldikss/vim-translator",
  -- {
  --   "JuanZoran/Trans.nvim",
  --   build = function () require'Trans'.install() end,
  --   dependencies = { 'kkharji/sqlite.lua', },
  -- },
  --------高亮
  "mtdl9/vim-log-highlighting",
  --------显示lsp状态
  "j-hui/fidget.nvim",
  --------平滑光标
  -- "gen740/SmoothCursor.nvim",
  ------------neoai,chatgpt
  { "Bryley/neoai.nvim", dependencies = { "MunifTanjim/nui.nvim" },},

  config = {
    compile_on_sync = true,
    -- 最大并发数
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
      -- 使用浮动窗口显示
      open_fn = function()
        return require('lazy.util').float({ border = 'single' })
      end,
    },
  },
})
