local status, hex = pcall(require, "hex")
if not status then
	vim.notify("没有找到 hex")
	return
end

require("hex").setup({
	dump_cmd = "xxd",
	assemble_cmd = "xxd -r",
	is_buf_binary_pre_read = function()
		return true
	end,
	is_buf_binary_post_read = function()
		return true
	end,
})
