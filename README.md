# BeginNeovim
neovim ~/.config/nvim    -----%100lua

转载自https://github.com/nshen/learn-neovim-lua
小改动基本没动准备配C/C++

version 0.0.1

--------------------------------------------------------------------------



github上的经典主题

非常有名的配色 [gruvbox community]的 Lua 移植版本，支持 [treesitter]

(https://github.com/ellisonleao/gruvbox.nvim)

gruvbox.nvim 改动none全透明

效果图

![image-20220804233055680](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220804233055680.png)


替换插件内的文件-- ~/.local/share/nvim/site/pack/packer/
插件内的下的同名文件


version 0.0.2

------------------------------------------------------------------------------------------------



快捷键小改动


c/c++准备


version0.0.3

---------------------------------------------------------------------------------------------



``apt install tree``权限``studo apt install tree``

在``~/.bashrc``中`vim ~/.bashrc`在最后添加`alisa tree='lt'`

可以用`lt`查看替代`ls`





![image-20220805122105804](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220805122105804.png)



​                           0.0.4




-----------------------------------------------------------------------------------------------

消除所有小毛病

增加插件并未配置更改快捷键备份

0.0.5



-------------

修改c/cpp可以用gd，gh，gr等ctrl+n对齐



0.0.6

-------------------------------------------------
在powershell中直接打开vim

节省vmmen占用资源内存百兆左右，打开速度在1m可以接受

powershell + scoop + oh-my-posh 最新版本

仅用于打开neovim，wsl虚拟机占用资源大除第一次启动较慢体验感更好

powershell实现类比于linux的alias效果不是很好用function

0.0.7

-------------------------------------------
nvim在windows下用户的appdate/local/nvim配置文件入口

添加c++调试dap用Vimspector实现安装lldb或gdb

用lldb调试，体验不好

0.0.8

----------------------------------------
powershell 的软连接function不是很好用

在插件toggleterm中加入`shell = 'pwsh.exe'`

在neovim中使用powershell作为终端

或`:terminal pwsh`

0.0.9

-----

在nvim中用`echo stdpath ("data")`查看插件安装目录

0.1.0
