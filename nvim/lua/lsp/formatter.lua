local status, formatter = pcall(require, "formatter")
if not status then
	vim.notify("没有找到 formatter")
	return
end

formatter.setup({
	filetype = {
		cpp = {
			-- clang-format
			function()
				return {
					exe = "clang-format --style=file:D:/CppApp/lf-windows-amd64/.clang-format",
					args = {},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
            "-",
					},
					stdin = true,
				}
			end,
		},
		c = {
			-- clang-format
			function()
				return {
					exe = "clang-format --style=file:D:/CppApp/lf-windows-amd64/.clang-format",
					args = {},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		python = {
			-- black
			function()
				return {
					exe = "black",
					args = {},
				}
			end,
		},
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
	},
})

-- format on save
-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.c,*.cpp,*.lua FormatWrite
-- augroup END
-- ]],
-- 	true
-- )
