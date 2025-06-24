vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			-- "<ESC>:w<CR>:TermExec direction=float cmd=\"g++ *.cpp -I ./ -o %:t:r.exe ; ./%:t:r.exe\"<CR>",
			-- '<ESC>:w<CR>:TermExec direction=float cmd="g++ %:t:r.cpp -o %:t:r.exe ; ./%:t:r.exe"<CR>',
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {g++ -I ../include/ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe} elseif(Get-Item ./include) {g++ -I ./include/ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe} else {g++ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<Ca-l>",
			-- "<ESC>:w<CR>:TermExec direction=float cmd=\"g++ *.cpp -I ./ -o %:t:r.exe ; ./%:t:r.exe\"<CR>",
			-- '<ESC>:w<CR>:TermExec direction=float cmd="g++ %:t:r.cpp -o %:t:r.exe ; ./%:t:r.exe"<CR>',
			'<ESC>:w<CR>:!start pwsh -nol -noe -c "if (Get-Item ../include) {g++ -I ../include/ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe} elseif(Get-Item ./include) {g++ -I ./include/ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe} else {g++ *.cpp -o %:t:r.exe ; clear ; ./%:t:r.exe}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F4>",
			-- "<ESC>:w<CR>:!g++ *.cpp -I ./ -o %:t:r.exe<CR>",
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {g++ -I ../include/ *.cpp -o %:t:r.exe ; exit} elseif(Get-Item ./include) {g++ -I ./include/ *.cpp -o %:t:r.exe ; exit} else {g++ *.cpp -o %:t:r.exe ; exit}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<C-F4>",
			-- "<ESC>:w<CR>:!g++ -g *.cpp -I ./ -o %:t:r.exe<CR>",
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {g++ -g -I ../include/ *.cpp -o %:t:r.exe ; exit} elseif(Get-Item ./include) {g++ -g -I ./include/ *.cpp -o %:t:r.exe ; exit} else {g++ -g *.cpp -o %:t:r.exe ; exit}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<S-F4>",
			-- "<ESC>:w<CR>:!g++ -g *.cpp -I ./ -o %:t:r.exe<CR>",
			'<ESC>:w<CR>:TermExec direction=float cmd="Get-Content a.txt | time ./%:t:r.exe > b.txt ; type b.txt"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-a>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;New-Item .\\$myCppClassName.cpp;exit"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-h>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;if (Get-Item ../include) {cd ../include/;New-Item .\\$myCppClassName.h;cd ../src} elseif(Get-Item ./include) {cd ./include;New-Item .\\$myCppClassName.h;cd ..} else {New-Item .\\$myCppClassName.h};exit"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-c>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;if (Get-Item ../include) {New-Item .\\$myCppClassName.cpp;cd ../include/;New-Item .\\$myCppClassName.h;cd ../src} elseif(Get-Item ./include) {New-Item .\\$myCppClassName.cpp;cd ./include;New-Item .\\$myCppClassName.h;cd ..} else {New-Item .\\$myCppClassName.cpp,.\\$myCppClassName.h};exit"<CR>',
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			-- "<ESC>:w<CR>:TermExec direction=float cmd=\"gcc *.c -I ./ -o %:t:r.exe ; ./%:t:r.exe\"<CR>",
			-- '<ESC>:w<CR>:TermExec direction=float cmd="gcc %:t:r.c -o %:t:r.exe ; ./%:t:r.exe"<CR>',
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {gcc -I ../include/ *.c -o %:t:r.exe ; clear ; ./%:t:r.exe} elseif(Get-Item ./include) {gcc -I ./include/ *.c -o %:t:r.exe ; clear ; ./%:t:r.exe} else {gcc *.c -o %:t:r.exe ; clear ; ./%:t:r.exe}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F4>",
			-- "<ESC>:w<CR>:!gcc *.c -I ./ -o %:t:r.exe<CR>",
			-- "<ESC>:w<CR>:!gcc %:t:r.c -o %:t:r.exe<CR>",
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {gcc -I ../include/ *.c -o %:t:r.exe ; exit} elseif(Get-Item ./include) {gcc -I ./include/ *.c -o %:t:r.exe ; exit} else {gcc *.c -o %:t:r.exe ; exit}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<C-F4>",
			-- "<ESC>:w<CR>:!gcc -g *.c -I ./ -o %:t:r.exe<CR>",
			-- "<ESC>:w<CR>:!gcc -g %:t:r.c -o %:t:r.exe<CR>",
			'<ESC>:w<CR>:TermExec direction=float cmd="if (Get-Item ../include) {gcc -g -I ../include/ *.c -o %:t:r.exe ; exit} elseif(Get-Item ./include) {gcc -g -I ./include/ *.c -o %:t:r.exe ; exit} else {gcc -g *.c -o %:t:r.exe ; exit}"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-a>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;New-Item .\\$myCppClassName.c;exit"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-h>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;if (Get-Item ../include) {cd ../include/;New-Item .\\$myCppClassName.h;cd ../src} elseif(Get-Item ./include) {cd ./include;New-Item .\\$myCppClassName.h;cd ..} else {New-Item .\\$myCppClassName.h};exit"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<CA-c>",
			'<ESC>:w<CR>:TermExec direction=float cmd="$myCppClassName=Read-Host;if (Get-Item ../include) {New-Item .\\$myCppClassName.c;cd ../include/;New-Item .\\$myCppClassName.h;cd ../src} elseif(Get-Item ./include) {New-Item .\\$myCppClassName.c;cd ./include;New-Item .\\$myCppClassName.h;cd ..} else {New-Item .\\$myCppClassName.c,.\\$myCppClassName.h};exit"<CR>',
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			'<ESC>:w<CR>:TermExec direction=float cmd="python %"<CR>',
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			'<ESC>:w<CR>:TermExec direction=float cmd="lua %"<CR>',
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			'<ESC>:w<CR>:TermExec direction=float cmd="javac %:t:r.java ; java %:t:r"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F4>",
			"<ESC>:w<CR>:!javac %:t:r.java<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			'<ESC>:w<CR>:TermExec direction=float cmd="go run %:t:r.go"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F4>",
			"<ESC>:w<CR>:!go build %:t:r.go<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F5>",
			'<ESC>:w<CR>:TermExec direction=float cmd="rustc %:t:r.rs ; ./%:t:r.exe"<CR>',
			{ silent = true, noremap = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F4>",
			"<ESC>:w<CR>:!rustc %:t:r.rs<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
