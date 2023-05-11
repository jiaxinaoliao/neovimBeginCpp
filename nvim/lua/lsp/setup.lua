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

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
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

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"lua_ls",
		"clangd",
    "csharp_ls",
		"cmake",
		"tsserver",
		"tailwindcss",
		"bashls",
		"cssls",
		"dockerls",
		"emmet_ls",
		"html",
		"jsonls",
		"pyright",
		"yamlls",
		"gopls",
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
	tsserver = require("lsp.config.ts"),
	rust_analyzer = require("lsp.config.rust"),
	yamlls = require("lsp.config.yamlls"),
	marksman = require("lsp.config.markdown"),
	jdtls = require("lsp.config.jdtls"),
	cmake = require("lsp.config.cmake"),
	gopls = require("lsp.config.gopls"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end

require("lsp.ui")
