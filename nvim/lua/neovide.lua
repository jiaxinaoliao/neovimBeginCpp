if vim.g.neovide then
  -- 设置字体以及大小
  vim.o.guifont = "ComicShannsMono Nerd Font Mono:h18"
  --
  vim.g.neovide_window_blurred = true
  -- 透明度
  vim.g.neovide_transparency = 0.66
  -- 全屏
  vim.g.neovide_fullscreen = false
  -- 设置行距
  vim.opt.linespace = 0
  -- 输入时隐藏光标
  vim.g.neovide_hide_mouse_when_typing = false
  -- 上次的大小
  vim.g.neovide_remember_window_size = true
  -- 动画时间
  vim.g.neovide_cursor_animation_length = 0.08
  -- 轨迹大小
  vim.g.neovide_cursor_trail_size = 0.5
  -- 抗锯齿
  vim.g.neovide_cursor_antialiasing = true
  -- 光标模式(void railgun torpedo pixiedust sonicboom ripple wireframe)
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- 粒子不透明度
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 15.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
end
