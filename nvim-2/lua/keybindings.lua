local M = {}

local opt = { noremap = true, silent = true }
local map = vim.keymap.set

-- $ 跳到行尾不带空格
map({ "n", "v" }, "$", "g_", opt)
map({ "n", "v" }, "g_", "$", opt)

-- 命令行 Ctrl+j/k
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- 平滑 j/k
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 滚动
map({ "n", "v" }, "<C-j>", "5j", opt)
map({ "n", "v" }, "<C-k>", "5k", opt)
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
map({ "n", "v" }, "?", "/\\v", { noremap = true, silent = false })

-- visual 缩进 / 移动
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("v", "p", '"_dP', opt)

-- 保存退出
map("n", "w", "<cmd>w<CR>", opt)
map("n", "wq", "<cmd>wq<CR>", opt)
map("n", "<leader>q", "<cmd>q<CR>", opt)
map("i", "jj", "<ESC>", opt)

-- insert 首尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
map("i", "<C-j>", "<ESC>ja", opt)
map("i", "<C-k>", "<ESC>ka", opt)

-- 窗口分屏
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sb", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)
map("n", "H", "<C-w>h", opt)
map("n", "J", "<C-w>j", opt)
map("n", "K", "<C-w>k", opt)
map("n", "L", "<C-w>l", opt)
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
map("n", "<C-Right>", ":vertical resize -5<CR>", opt)
map("n", "<C-Left>", ":vertical resize +5<CR>", opt)
map("n", "s,", ":vertical resize +1<CR>", opt)
map("n", "s.", ":vertical resize -1<CR>", opt)
map("n", "sj", ":resize -1<CR>", opt)
map("n", "sk", ":resize +1<CR>", opt)
map("n", "<C-Down>", ":resize -5<CR>", opt)
map("n", "<C-Up>", ":resize +5<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "<CA-z>", ":let &showtabline = (&showtabline == 2 ? 0 : 2)<CR>", opt)
map("n", "<SA-z>", ":let &laststatus = (&laststatus == 2 ? 0 : 2)<CR>", opt)

-- Terminal 快捷键（不用插件，纯 :terminal）
map("n", "stb", ":sp | terminal pwsh -nologo<CR>", opt)
map("n", "stv", ":vsp | terminal pwsh -nologo<CR>", opt)
map("n", "ss", ":terminal pwsh -nologo<CR>", opt)
map("t", "jj", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[<C-\><C-N><C-w>h]], opt)
map("t", "<C-j>", [[<C-\><C-N><C-w>j]], opt)
map("t", "<C-k>", [[<C-\><C-N><C-w>k]], opt)
map("t", "<C-l>", [[<C-\><C-N><C-w>l]], opt)
map("t", "<leader>h", [[<C-\><C-N><C-w>h]], opt)
map("t", "<leader>j", [[<C-\><C-N><C-w>j]], opt)
map("t", "<leader>k", [[<C-\><C-N><C-w>k]], opt)
map("t", "<leader>l", [[<C-\><C-N><C-w>l]], opt)

-- tab 命令
map("n", "tbn", "<cmd>tabnew<CR>", opt)
map("n", "tbx", "<cmd>tabnext<CR>", opt)
map("n", "tbc", "<cmd>tabclose<CR>", opt)

-- 折叠
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- Ctrl+/ 注释
map("n", "<C-_>", "gc", { noremap = false })
map("v", "<C-_>", "gc", { noremap = false })

-- 保存 + 格式化
map("n", "<C-s>", ":w<CR>:Format<CR>:w<CR>", opt)

-- 关闭 buffer
map("n", "xx", ":bdelete!<CR>", opt)
map("n", "xc", "<cmd>bdelete!<CR><cmd>close<CR>", opt)

------------------------------------------------------------
-- 给插件用的辅助函数（不注册全局键，只返回函数）
------------------------------------------------------------

-- LSP 快捷键
M.mapLSP = function(mapbuf)
    mapbuf("n", "<leader>s", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", opt)
    mapbuf("n", "<leader>cm", "<cmd>Lspsaga rename<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    mapbuf("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
    mapbuf("n", "gt", "<cmd>Lspsaga peek_definition<CR>", opt)
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
    mapbuf("n", "<F8>", "<cmd>Lspsaga outline<CR>", opt)
end

-- TypeScript LSP 额外键（原 mapTsLSP 缺失，这里补上）
M.mapTsLSP = function(mapbuf)
    mapbuf("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>", opt)
    mapbuf("n", "<leader>ai", "<cmd>TSToolsAddMissingImports<CR>", opt)
    mapbuf("n", "<leader>uf", "<cmd>TSToolsFixAll<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>TSToolsRenameFile<CR>", opt)
    mapbuf("n", "<leader>ci", "<cmd>TSToolsRemoveUnusedImports<CR>", opt)
end

-- DAP 快捷键
M._dapTerminate = function()
    local ok = pcall(function()
        require("dap").terminate()
        require("dap").disconnect()
        require("dap").close()
        require("dap.repl").close()
        require("dapui").close()
        require("dap").clear_breakpoints()
        vim.cmd("only")
    end)
end

-- cmp
M.cmp = function(cmp)
    local luasnip = require("luasnip")
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<A-,>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
end

-- Comment.nvim 配置
M.comment = {
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
}

-- Gitsigns 配置
M.gitsigns = {
    { "n", "<leader>gj", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() require("gitsigns").next_hunk() end)
        return "<Ignore>"
    end, { expr = true } },
    { "n", "<leader>gk", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() require("gitsigns").prev_hunk() end)
        return "<Ignore>"
    end, { expr = true } },
    { { "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>" },
    { "n", "<leader>gS", function() require("gitsigns").stage_buffer() end },
    { "n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end },
    { { "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>" },
    { "n", "<leader>gR", function() require("gitsigns").reset_buffer() end },
    { "n", "<leader>gp", function() require("gitsigns").preview_hunk() end },
    { "n", "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end },
    { "n", "<leader>gd", function() require("gitsigns").diffthis() end },
    { "n", "<leader>gD", function() require("gitsigns").diffthis("~") end },
    { "n", "<leader>gtd", function() require("gitsigns").toggle_deleted() end },
    { "n", "<leader>gtb", function() require("gitsigns").toggle_current_line_blame() end },
    { { "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>" },
}

-- Telescope 内键位
M.telescopeList = {
    i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-n>"] = "move_selection_next",
        ["<C-p>"] = "move_selection_previous",
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        ["<C-c>"] = "close",
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

return M
