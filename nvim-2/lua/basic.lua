local o = vim.o
local wo = vim.wo
local opt = {
    fileencoding = "UTF-8",
    scrolloff = 8,
    sidescrolloff = 8,
    history = 2000,
    tabstop = 4,
    softtabstop = 4,
    shiftround = true,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
    cmdheight = 0,
    autoread = true,
    wrap = true,
    whichwrap = "b,s,h,l,<,>,[,]",
    hidden = true,
    mouse = "a",
    backup = false,
    writebackup = false,
    swapfile = false,
    updatetime = 200,
    timeoutlen = 200,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    list = true,
    wildoptions = "pum",
    pumheight = 6,
    showmode = false,
    clipboard = "unnamedplus",
    nrformats = "bin,hex",
    autochdir = false,
    showtabline = 2,
    laststatus = 3,
}
for k, v in pairs(opt) do
    o[k] = v
end

wo.number = true
wo.relativenumber = true
wo.numberwidth = 1
wo.cursorline = false
wo.signcolumn = "yes"

vim.opt.shortmess:append("c")
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- 用 lcd 代替 autochdir，避免破坏 LSP/Telescope 的 cwd
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.buftype == "" and vim.fn.expand("%:p:h") ~= "" then
            vim.cmd("silent! lcd " .. vim.fn.fnameescape(vim.fn.expand("%:p:h")))
        end
    end,
})
