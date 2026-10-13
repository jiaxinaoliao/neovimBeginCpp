local ok, _ = pcall(require, "mason")
if not ok then
    vim.notify("没有找到 mason", vim.log.levels.WARN)
    return
end

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

pcall(function()
    require("mason-lspconfig").setup({
        ensure_installed = {},          -- 手动安装
        automatic_installation = false,
    })
end)

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

-- 每个 server 的配置表
local servers = {
    lua_ls        = require("lsp.config.lua"),
    clangd        = require("lsp.config.clangd"),
    csharp_ls     = require("lsp.config.csharp"),
    pyright       = require("lsp.config.pyright"),
    bashls        = require("lsp.config.bash"),
    html          = require("lsp.config.html"),
    cssls         = require("lsp.config.css"),
    emmet_ls      = require("lsp.config.emmet"),
    jsonls        = require("lsp.config.json"),
    ts_ls         = require("lsp.config.ts"),
    rust_analyzer = require("lsp.config.rust"),
    yamlls        = require("lsp.config.yamlls"),
    marksman      = require("lsp.config.markdown"),
    jdtls         = require("lsp.config.jdtls"),
    cmake         = require("lsp.config.cmake"),
    gopls         = require("lsp.config.gopls"),
}

-- Neovim 0.11+：用官方 vim.lsp.config / vim.lsp.enable
-- Neovim 0.10-：用 lspconfig.setup
local has_new_api = vim.lsp.config ~= nil and vim.lsp.enable ~= nil

if has_new_api then
    for name, cfg in pairs(servers) do
        if cfg ~= nil and type(cfg) == "table" then
            vim.lsp.config(name, cfg)
        end
    end
    -- 一次性启用所有 server（lspconfig 会按 filetype 自动附加）
    vim.lsp.enable(vim.tbl_keys(servers))
else
    local lspconfig = require("lspconfig")
    for name, cfg in pairs(servers) do
        if cfg ~= nil and type(cfg) == "table" then
            lspconfig[name].setup(cfg)
        end
    end
end

-- 最后加载 UI 配置
require("lsp.ui")
