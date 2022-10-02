--vim.o.background = "dark"
--vim.g.tokyonight_style = "stom" -- day / night
-- 半透明
--vim.g.gruvbox_transparent = true
--vim.g.gruvbox_transparent_sidebar = true
local colorscheme = "gruvbox"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
-- default
-- dark_catppuccino

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
