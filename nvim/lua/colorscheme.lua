-- vim.o.background = "dark"

require("vscode").setup({
	transparent = true,
	italic_comments = true,
	underline_links = false,
	disable_nvimtree_bg = true,
	terminal_colors = false,
	color_overrides = {
		vscLineNumber = "#C0C0C0",
		vscTabCurrent = "NONE",
		vscTabOther = "#606060",
		vscTabOutside = "NONE",
		vscPopupFront = "#FFFFFF",
		vscPopupBack = "NONE",
		vscPopupHighlightBlue = "#606060",
		vscPopupHighlightGray = "#606060",
	},
})

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	float = {
		transparent_background = true,
		solid = false,
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		telescope = { enabled = true },
		notify = true,
		mini = true,
		which_key = true,
        Trans = true,
	},
})

local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
	return
end
