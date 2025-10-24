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

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"lua_ls",
		"clangd",
		"csharp_ls",
		"cmake",
		"ts_ls",
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

require("lsp.ui")
