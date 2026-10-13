local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.notify("正在安装 lazy.nvim...", vim.log.levels.INFO)
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins.theme" },
        { import = "plugins.ui" },
        { import = "plugins.editor" },
        { import = "plugins.treesitter" },
        { import = "plugins.lsp" },
        { import = "plugins.cmp" },
        { import = "plugins.ai" },
        { import = "plugins.dap" },
        { import = "plugins.misc" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    checker = { enabled = false },
    change_detection = { notify = false },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip", "matchit", "matchparen", "netrwPlugin",
                "tarPlugin", "tohtml", "tutor", "zipPlugin",
            },
        },
    },
})
