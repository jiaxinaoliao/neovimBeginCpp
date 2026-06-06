local status_ok, neocodeium = pcall(require, "neocodeium")
if not status_ok then
    vim.notify("没有找到 neocodeium")
    return
end

neocodeium.setup({
    enabled = true,
    debounce = false, -- 保持建议的流畅性
    manual = false, -- 保持自动建议开启
})

vim.keymap.set("i", "<A-f>", function()
    require("neocodeium").accept()
end)
