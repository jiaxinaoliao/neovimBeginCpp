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
        "wbthomason/packer.nvim",
        -- 加速lua
        "lewis6991/impatient.nvim",
        ------------------ 基础插件------------------
        ------------------ 基本api ------------------
        "nvim-lua/plenary.nvim",
        ------------------ 弹窗窗口 -----------------
        --use('nvim-lua/popup.nvim')
        "rcarriga/nvim-notify",
        "MunifTanjim/nui.nvim",
        "folke/noice.nvim",
        ------------------ 图标插件 -----------------
        "kyazdani42/nvim-web-devicons",
        ------------------ 文件树   -----------------
        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            requires = { "nvim-tree/nvim-web-devicons" },
        },
        "preservim/tagbar",
        ------------------上下状态栏 ----------------
        -- bufferline
        "akinsho/bufferline.nvim",
        "kyazdani42/nvim-web-devicons", 
        "moll/vim-bbye",
        
        -- lualine
        {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        },
        "arkav/lualine-lsp-progress",
        ------------------ 多光标 ----------------
        "mg979/vim-visual-multi",
        ------------------ 搜索弹窗 ----------------
        -- telescope
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-live-grep-raw.nvim",
        "LinArcX/telescope-env.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-rg.nvim",
        "nvim-telescope/telescope-dap.nvim",
        ---------------- markdown预览 -------------
        "iamcco/markdown-preview.nvim",
        ------------------- 跳转插件-------------
        "ggandor/flit.nvim",
        --use("ggandor/leap-ast.nvim")
        --use("ggandor/leap-spooky.nvim")
        "ggandor/leap.nvim",
        -- dashboard-nvim
        "glepnir/dashboard-nvim",
        -- project
        --use("ahmedkhalf/project.nvim")
        --------语法高亮 treesitter
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
        -- use("Shatur/neovim-cmake")
        -- 补全引擎
        "hrsh7th/nvim-cmp",
        -- 补全源
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
        "hrsh7th/cmp-buffer", -- { name = 'buffer' },
        "hrsh7th/cmp-path", -- { name = 'path' }
        "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
        "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
        -- 常见编程语言代码段
        "rafamadriz/friendly-snippets",
        -- UI 增强
        "onsails/lspkind-nvim",
        "tami5/lspsaga.nvim",
        -- 代码格式化
        "mhartington/formatter.nvim",
        --use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- TypeScript 增强
        { "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" },
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
        "mhartington/oceanic-next",
        -- gruvbox
        "ellisonleao/gruvbox.nvim",
        -- zephyr
        "glepnir/zephyr-nvim",
        -- nord
        "shaunsingh/nord.nvim",
        -- onedark
        "ful1e5/onedark.nvim",
        -- nightfox
        "EdenEast/nightfox.nvim",
        -- vscode
        "Mofiqul/vscode.nvim",
        -- catppuccin
        { "catppuccin/nvim", as = "catppuccin" },
        --------------------主题透明---------------------------
        "xiyaowong/nvim-transparent",
        ----------------------纯净模式-------------------------
        "Pocco81/true-zen.nvim",
        --不同位置的终端tt
        "akinsho/toggleterm.nvim",
        ------关键字调用hop跳转
        "folke/which-key.nvim",
        {
            "phaazon/hop.nvim", -- like easymotion, but more powerful
            branch = "v2", -- optional but strongly recommended
        },
        -- surround
        "kylechui/nvim-surround",
        -- Comment
        "numToStr/Comment.nvim",
        -- nvim-autopairs括号补全
        "windwp/nvim-autopairs",
        -- git
        "lewis6991/gitsigns.nvim",
        -- vimspector
        --use('puremourning/vimspector')
        ---------------------------dap调试--------------
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        {
            "rcarriga/nvim-dap-ui",
            requires = { "mfussenegger/nvim-dap" },
        },
        -------------lf插件----------
        {
            "ptzz/lf.vim",
            requires = { "voldikss/vim-floaterm" },
        },
        -----翻译插件
        "voldikss/vim-translator",
        --------高亮
        "mtdl9/vim-log-highlighting",
        --------显示lsp状态
        "j-hui/fidget.nvim",
        ----------------测试代码片段
        -- use('vim-test/vim-test')
        -- use('nvim-neotest/neotest')
        --------------自动保存
        -- use("Pocco81/AutoSave.nvim")
        -- use('djoshea/vim-autoread')
        -----------j，k加速
        -- use('rhysd/accelerated-jk')
        ------------导航栏
        -- use('aserowy/tmux.nvim')

    config = {
        -- profile = {
        --   enable = true,
        --   threshold = 1,
        -- },
        compile_on_sync = true,
        -- profile = {
        --   enable = false,
        --   threshold = 1
        -- },
        -- 锁定插件版本在snapshots目录
        --snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
        -- 这里锁定插件版本在v1，不会继续更新插件
        --snapshot = "v1",

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
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
