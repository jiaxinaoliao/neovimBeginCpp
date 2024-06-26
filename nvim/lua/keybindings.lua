-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = {
	noremap = true,
	silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
--map('n', '<C-u>', '10k', opt)
--map('n', '<C-d>', '10j', opt)

-- magic search
map("n", "?", "/\\v", { noremap = true, silent = false })
map("v", "?", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "w", "<cmd>w<CR>", opt)
map("n", "wq", ":wq<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)
--map('n', "<leader>qq", ":qa!<CR>", opt)
map("i", "jj", "<ESC>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
map("i", "<C-j>", "<ESC>ja", opt)
map("i", "<C-k>", "<ESC>ka", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sb", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- ctrl + hjkl  窗口之间跳转
map("n", "H", "<C-w>h", opt)
map("n", "J", "<C-w>j", opt)
map("n", "K", "<C-w>k", opt)
map("n", "L", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Right>", ":vertical resize -1<CR>", opt)
map("n", "<C-Left>", ":vertical resize +1<CR>", opt)
map("n", "s,", ":vertical resize +5<CR>", opt)
map("n", "s.", ":vertical resize -5<CR>", opt)
-- 上下比例
map("n", "sj", ":resize -1<CR>", opt)
map("n", "sk", ":resize +1<CR>", opt)
-- map('n', '<C-Down>', ':resize -1<CR>', opt)
-- map('n', '<C-Up>', ':resize +1<CR>', opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "stb", ":sp | terminal pwsh -nologo<CR>", opt)
map("n", "stv", ":vsp | terminal pwsh -nologo<CR>", opt)
map("n", "ss", ":terminal pwsh -nologo<CR>", opt)
-- Esc 回 Normal 模式
map("t", "jj", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)

map("n", "tbn", "<cmd>tabnew<CR>", opt)
map("n", "tbx", "<cmd>tabnext<CR>", opt)
map("n", "tbc", "<cmd>tabclose<CR>", opt)
--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}
-- treesitter 折叠
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)
--markdown
map("n", "<leader>mb", ":MarkdownPreview<CR>", opt)
map("n", "<leader>me", ":MarkdownPreviewStop<CR>", opt)
-- 跳转
map("n", "<leader>w", ":HopWord<CR>", opt)
-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
-- nvim-tree的已经放在plugin-config\nvim-tree.lua里面了
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "xx", ":Bdelete!<CR>", opt)
map("n", "xc", "<cmd>Bdelete!<CR><cmd>close<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>xh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>xl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>xo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>xp", ":BufferLinePickClose<CR>", opt)

-- 翻译
map("v", "fy", ":TranslateW<CR>", opt)

-- Telescope
map("n", "<C-f>", ":Telescope find_files<CR>", opt)
map("n", "<C-p>", ":Telescope live_grep<CR>", opt)
map("n", "<C-b>", ":Telescope buffers<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<C-n>"] = "move_selection_next",
		["<C-p>"] = "move_selection_previous",
		-- 历史记录
		["<Down>"] = "cycle_history_next",
		["<Up>"] = "cycle_history_prev",
		-- 关闭窗口
		-- ["<esc>"] = actions.close,
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

-- ctrl + s 格式化
map("n", "<C-s>", ":Format<CR>", opt)

--- chatgpt  neoai.nvim
map("n", "<leader>a", ":NeoAI<CR>", opt)
map("n", "<leader>i", ":NeoAIInject ", opt)

-- ctrl + g 纯净模式
-- leader + gg 选中纯净模式
map("n", "<leader>h", ":TZMinimalist<CR>", opt)
map("v", "<leader>h", ":TZNarrow<CR>", opt)

-- 细胞cam 游戏cha
map("n", "cam", ":CellularAutomaton make_it_rain<CR>", opt)
map("n", "cag", ":CellularAutomaton game_of_life<CR>", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "<leader>s", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opt)
	mapbuf("n", "cm", "<cmd>Lspsaga rename<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	mapbuf("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
	mapbuf("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opt)
	mapbuf("n", "gt", "<cmd>Lspsaga peek_definition<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
	mapbuf("n", "<F8>", "<cmd>Lspsaga outline<CR>", opt)
end

-- typescript 快捷键
-- pluginKeys.mapTsLSP = function(mapbuf)
--   mapbuf('n', 'gs', ':TSLspOrganize<CR>', opt)
--   mapbuf('n', 'gR', ':TSLspRenameFile<CR>', opt)
--   mapbuf('n', 'gi', ':TSLspImportAll<CR>', opt)
-- end

-- nvim-dap
pluginKeys.mapDAP = function()
	-- 结束
	map(
		"n",
		"<S-F5>",
		":lua require'dap'.terminate()<CR>"
			-- ":lua require'dap'.disconnect()<CR>"
			.. ":lua require'dap'.close()<CR>"
			.. ":lua require'dap.repl'.close()<CR>"
			.. ":lua require'dapui'.close()<CR>"
			.. ":lua require('dap').clear_breakpoints()<CR>"
			.. "<C-w>o<CR>",
		opt
	)
	-- 开始/继续
	map("n", "<C-F5>", ":lua require'dap'.continue()<CR>", opt)
	-- 设置断点
	map("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<CR>", opt)
	map("n", "<S-F6>", ":lua require'dap'.clear_breakpoints()<CR>", opt)
	--  stepOver, stepOut, stepInto
	map("n", "<F12>", ":lua require'dap'.step_over()<CR>", opt)
	map("n", "<S-F7>", ":lua require'dap'.step_out()<CR>", opt)
	map("n", "<F7>", ":lua require'dap'.step_into()<CR>", opt)
	-- 弹窗
	map("n", "<S-F12>", ":lua require'dapui'.eval()<CR>", opt)
	-- 重启
	map("n", "<F10>", ":lua require'dap'.restart()<CR>", opt)
	map("n", "<S-F10>", ":lua require'dap'.terminate()<CR>", opt)
end
--
-- -- vimspector
-- pluginKeys.mapVimspector = function()
--   -- 开始
--   map('n', '<leader>dd', ':call vimspector#Launch()<CR>', opt)
--   -- 结束
--   map('n', '<Leader>de', ':call vimspector#Reset()<CR>', opt)
--   -- 继续
--   map('n', '<Leader>dc', ':call vimspector#Continue()<CR>', opt)
--   -- 设置断点
--   map('n', '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>', opt)
--   map('n', '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>', opt)
--   --  stepOver, stepOut, stepInto
--   map('n', '<leader>dj', '<Plug>VimspectorStepOver', opt)
--   map('n', '<leader>dk', '<Plug>VimspectorStepOut', opt)
--   map('n', '<leader>dl', '<Plug>VimspectorStepInto', opt)
-- end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 确认
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}
end

------一键运行
-- map('n', '<F4>', ':!g++ *.cpp<CR>', opt)
-- map('n', '<C-F4>', ':!g++ -g *.cpp<CR>', opt)
-- map('n', '<F5>', ':!a.exe<CR>', opt)

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>tt 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
	vim.keymap.set({ "n", "t" }, "tt", toggleterm.toggleA)
	vim.keymap.set({ "n", "t" }, "tb", toggleterm.toggleB)
	vim.keymap.set({ "n", "t" }, "tc", toggleterm.toggleC)
	vim.keymap.set({ "n", "t" }, "tg", toggleterm.toggleG)
	-- vim.keymap.set({ 'n', 't' }, '<F5>', toggleterm.toggleE)
end

-- gitsigns查看更改记录
pluginKeys.gitsigns_on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "<leader>gj", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map("n", "<leader>gk", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
	map("n", "<leader>gS", gs.stage_buffer)
	map("n", "<leader>gu", gs.undo_stage_hunk)
	map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
	map("n", "<leader>gR", gs.reset_buffer)
	map("n", "<leader>gp", gs.preview_hunk)
	map("n", "<leader>gb", function()
		gs.blame_line({ full = true })
	end)
	map("n", "<leader>gd", gs.diffthis)
	map("n", "<leader>gD", function()
		gs.diffthis("~")
	end)
	-- toggle
	map("n", "<leader>gtd", gs.toggle_deleted)
	map("n", "<leader>gtb", gs.toggle_current_line_blame)
	-- Text object
	map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
