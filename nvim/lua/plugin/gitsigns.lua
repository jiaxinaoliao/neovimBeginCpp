-- https://github.com/lewis6991/gitsigns.nvim
local status, gitsigns = pcall(require, "gitsigns")
if not status then
  vim.notify("没有找到 gitsigns")
  return
end

gitsigns.setup({

  -- 字母图标 A 增加，C修改，D 删除
  signs = {
    add = { text = "A|" },
    change = { text = "C|" },
    delete = { text = "D_" },
    topdelete = { text = "D‾" },
    changedelete = { text = "D~" },
  },
  -- 显示图标
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  -- 行数高亮
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = require("keybindings").gitsigns,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = require("keybindings").gitsigns_on_attach,
})
