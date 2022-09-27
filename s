[33mtag v1.0.1[m
Tagger: shuangshuangbb <17600930534@163.com>
Date:   Tue Sep 27 10:05:19 2022 +0800

22.9.27/10

[33mcommit 802f5b838b3f71c4b174b0aed3c58d911f584dc7[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m, [m[1;33mtag: v1.0.1[m[33m, [m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: shuangshuangbb <17600930534@163.com>
Date:   Tue Sep 27 10:04:55 2022 +0800

    22.9.27/10

[1mdiff --git a/README.md b/README.md[m
[1mindex 2b008b7..694fe2e 100644[m
[1m--- a/README.md[m
[1m+++ b/README.md[m
[36m@@ -347,6 +347,36 @@[m [mllvm-mingw里面还包含了gcc，g++和clang一样[m
 [m
 [m
 [m
[32m+[m[32m补充：[m
[32m+[m
[32m+[m[32m[Releases · llvm/llvm-project (github.com)](https://github.com/llvm/llvm-project/releases)[m
[32m+[m
[32m+[m[32mllvm的github上有了windows班去github上下载llvm-win32或64位的安装程序[m
[32m+[m
[32m+[m[32m选择添加环境变量安装即可[m
[32m+[m
[32m+[m[32m优点：llvm-win用的是vs库文件需要安转vs或者安装vs的库[m
[32m+[m
[32m+[m[32mllvm-mingw用的是gnu的库可以用`clang -v`来查看[m
[32m+[m
[32m+[m[32m![屏幕截图 2022-09-27 095804](E:\github\neovimBeginCpp\屏幕截图 2022-09-27 095804.png)[m
[32m+[m
[32m+[m[32mmsvc就是vs的链接库llvm-win默认用的就是vs的[m
[32m+[m
[32m+[m[32mgnu就是mingw的库llvm-mingw默认用的就是gnu的[m
[32m+[m
[32m+[m[32mmsvc的好处是，在终端支持中文显示，但是在neovim内会utf-8乱码（个人觉得不影响-在终端使用方便）[m
[32m+[m
[32m+[m[32mllvm-mingw默认用的gnu的库，utf-8在vim和终端中都是英文不会乱码[m
[32m+[m
[32m+[m[32m用llvm-wim的msvc不管是.c还是.cpp文件都可以用clang编译[m
[32m+[m
[32m+[m[32m但是gnu的.cpp必须用clang++编译[m
[32m+[m
[32m+[m[32mwin和mingw二选一即可（推荐llvm-win（msvc））[m
[32m+[m
[32m+[m
[32m+[m
 到这里基本所有需要的程序就都已经安装完毕了[m
 [m
 [m
[1mdiff --git a/nvim/lua/keybindings.lua b/nvim/lua/keybindings.lua[m
[1mindex 64a7c53..8a49863 100644[m
[1m--- a/nvim/lua/keybindings.lua[m
[1m+++ b/nvim/lua/keybindings.lua[m
[36m@@ -392,8 +392,8 @@[m [mpluginKeys.cmp = function(cmp)[m
 end[m
 [m
 ------一键运行[m
[31m-map('n', '<F5>', ':!clang++ %<CR>', opt)[m
[31m-map('n', '<F4>', ':!clang++ -g %<CR>', opt)[m
[32m+[m[32mmap('n', '<F5>', ':!clang %<CR>', opt)[m
[32m+[m[32mmap('n', '<F4>', ':!clang -g %<CR>', opt)[m
 [m
 -- 自定义 toggleterm 3个不同类型的命令行窗口[m
 -- <leader>ta 浮动[m
[1mdiff --git "a/\345\261\217\345\271\225\346\210\252\345\233\276 2022-09-27 095804.png" "b/\345\261\217\345\271\225\346\210\252\345\233\276 2022-09-27 095804.png"[m
[1mnew file mode 100644[m
[1mindex 0000000..9a51c2f[m
Binary files /dev/null and "b/\345\261\217\345\271\225\346\210\252\345\233\276 2022-09-27 095804.png" differ
