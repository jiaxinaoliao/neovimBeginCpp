vim.keymap.set(
  "n",
  "<mapping>",
  function()
    require("lf").start(
      -- nil, -- this is the path to open Lf (nil means CWD)
              -- this argument is optional see `.start` below
      {
        -- Pass options (if any) that you would like
        dir = "F:/MyCode", -- directory where `lf` starts ('gwd' is git-working-directory)
        direction = "float", -- window type: float horizontal vertical
        border = "double", -- border kind: single double shadow curved
        height = 0.80, -- height of the *floating* window
        width = 0.85, -- width of the *floating* window
        mappings = false, -- whether terminal buffer mapping is enabled
    })
  end,
  { noremap = true }
)
