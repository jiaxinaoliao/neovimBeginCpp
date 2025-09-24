local status, transparent = pcall(require, "transparent")
if not status then
	vim.notify("没有找到 transparent.nvim")
	return
end

require("transparent").setup({
	enable = true, -- 启用透明背景
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {
		"NormalFloat",
		"FloatBorder",
		"CursorLine",
		"CursorLineNr",
	}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
	on_clear = function() end,
})

-- 启动时自动启用透明模式
vim.g.transparent_enabled = true
