return {
	-- 主题
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = { light = "latte", dark = "mocha" },
				transparent_background = true,
				show_end_of_buffer = false,
				term_colors = false,
				float = { transparent_background = true, solid = false },
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					telescope = { enabled = true },
					notify = true,
					mini = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- 透明背景
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		priority = 999,
		opts = {
			enable = true,
			groups = {
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
				"EndOfBuffer",
				"CursorLineNr",
				"CursorLine",
				"NormalFloat",
				"FloatBorder",
			},
			extra_groups = {},
			exclude_groups = {},
			on_clear = function() end,
		},
	},
}
