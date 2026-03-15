local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

-- 对于 nvim-lspconfig 0.11+，使用新的 API
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- 使用新 API (Neovim 0.11+)
local use_new_api = true

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写, 手动安装
    ensure_installed = {
        -- "jdtls",
        -- "lua_ls",
        -- "clangd",
        -- "csharp_ls",
        -- "cmake",
        -- "ts_ls",
        -- "tailwindcss",
        -- "bashls",
        -- "cssls",
        -- "dockerls",
        -- "emmet_ls",
        -- "html",
        -- "jsonls",
        -- "pyright",
        -- "yamlls",
        -- "gopls",
    },
})

-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    lua_ls = require("lsp.config.lua"),
    clangd = require("lsp.config.clangd"),
    csharp_ls = require("lsp.config.csharp"),
    pyright = require("lsp.config.pyright"),
    bashls = require("lsp.config.bash"),
    html = require("lsp.config.html"),
    cssls = require("lsp.config.css"),
    emmet_ls = require("lsp.config.emmet"),
    jsonls = require("lsp.config.json"),
    ts_ls = require("lsp.config.ts"),
    rust_analyzer = require("lsp.config.rust"),
    yamlls = require("lsp.config.yamlls"),
    marksman = require("lsp.config.markdown"),
    jdtls = require("lsp.config.jdtls"),
    cmake = require("lsp.config.cmake"),
    gopls = require("lsp.config.gopls"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        if use_new_api then
            -- 使用新 API (nvim 0.11+)
            vim.lsp.config._configs[name] = config
        else
            -- 使用旧 API
            lspconfig[name].setup(config)
        end
    else
        if use_new_api then
            vim.lsp.config._configs[name] = {}
        else
            lspconfig[name].setup({})
        end
    end
end

-- 对于新 API，需要调用 vim.lsp.enable 来启用配置的服务器
if use_new_api then
    vim.lsp.enable(vim.tbl_keys(servers))
end

require("lsp.ui")
