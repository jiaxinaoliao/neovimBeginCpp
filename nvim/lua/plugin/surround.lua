local status, surround = pcall(require, "nvim-surround")
if not status then
    vim.notify("没有找到 nvim-surround")
    return
end

surround.setup({
    event = "VeryLazy",
    mappings_style = "nvim-surround",
})
