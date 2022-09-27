# 纯windows下的neovim快速配置过程

https://github.com/shuangshuangbb/neovimBeginCpp

虽然不是开箱即用但是也省略了大部分配置时间

下载之后进行简单的安装即可使用

纯windows环境**不需要虚拟机**纯windows环境下

linux--wsl（ubuntu22.04LTS）（配置文件在.config）也可以，小改动即可

macos应该也能兼容（没有试过）



## 1. 简介

win10或者win11都可以主要用于c\c++的学习使用（学习编程或者小项目）

**主要用于windows下的 学习编程  学习编程  学习编程 c\c++ c\c++ c\c++**

python应该也可以（没有试过）

可以实现IDE的基本功能（编译、运行、调试、跳转、报错、提示等等）



**系统：**利用的win11的环境**windows11专业版21H2版本**

**终端：**最新版的**Windows Terminal**＋**powershell**

* 注意 ：Microsoft powershell和powershell不一样

PowerShell 7.2 是下一个长期服务 (LTS) 版本，基于 .NET 6.0 构建。

在windows和macos和linux都可以支持

**美化：** **oh-my-push**

编译用的clangd调试用的lldb

windows下lldb用的是MinGW64的llvm-mingw



利用的工具是scoop类比于ubuntu下的apt，apt-get



**具体机型配置无所谓，不需要太好的性能八代i3的cpu也能带的动，占用资源超级小**



**总结：windows + windows terminal + powershell + oh-my-push + neovim + cpp（clang + lldb）**



主要用于C++其他语言也可以，前端、python、java等也可以，需要小改动



## 2. 环境安装

win10和win11差不多都可以兼容

### 2.1 下载配置文件

首先下载仓库(https://github.com/shuangshuangbb/neovimBeginCpp)打开网址

打不开github的话可以考虑用fastgithub进行加速百度下载就行

windows直接下载压缩包之后解压放在一边（方便的位置如桌面配置之后可以删除）![克隆](E:\github\neovimBeginCpp\克隆.png)



### 2.2 配置终端设置

微软商店下载最新版本**Windows Terminal**和**Powershell**

打开下载的配置文件夹里面有一个Inconsolata LGC Bold Nerd Font Complete Mono Windows Compatible.ttf字体双击打开安装即可或者自行去(https://www.nerdfonts.com/)官网下载nerd fonts的自己喜欢的字体

之后打开windows terminal以下简称wt

打开wt的设置，在设置中打开配置JSON文件如图

![wt配置](E:\github\neovimBeginCpp\wt配置.png)

打开配置文件夹打开**windowsterminal 配置.txt**文件将其中的内容复制**替换**原本的JSON配置文件

之后保存关闭即可，再次打开wt如果改变说明设置成功，标签栏默认隐藏（alt+z可以打开打开标签栏）如果不习惯也可以在设置->启动->启动模式中的启动模式改为别的即可

也可以在wt的设置中打开默认值->外观

![wt设置](E:\github\neovimBeginCpp\wt设置.png)

之后根据自己的喜好设置透明度或者背景等，也可以更改其他nerd fonts字体

设置完成之后wt就可以投入使用了

可以用win+r输入wt快速打开和用cmd类似可以理解为高级好看的cmd终端



### 2.3 Scoop包管理器

scoop是windows下的一个强大的包管理器可以方便快速的安装软件



#### 2.3.1 scoop安装

安装scoop很简单只需要在powershell中输入一条指令

`iwr -useb get.scoop.sh | iex`即可自动安装

但是默认是在C盘安装所以在运行之前先要更改地址

并且要让powershell可以执行脚本需要输入

`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

回车即可

之后依次输入下面的**两条指令**'D:\Applications\Scoop'单引号内部的地址可以更改其他的不要动

```powershell
$env:SCOOP='D:\Applications\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
```

第一条指令没有问题第二条指令也一样单引号内的地址可以更改可能需要管理员身份右键wt以管理身份运行即可

```powershell
$env:SCOOP_GLOBAL='D:\Applications\GlobalScoopApps' [Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL,'Machine')
```

输入上两条指令之后再输入`iwr -useb get.scoop.sh | iex`即可开始安装scoop了

安装完成之后在'D:\Applications\Scoop'的地方会有一个scoop的文件夹里面会有

- apps——所有通过scoop安装的软件都在里面。
- buckets——管理软件的仓库，用于记录哪些软件可以安装、更新等信息，默认添加`main`仓库，主要包含无需GUI的软件，可手动添加其他仓库或自建仓库，具体在[推荐软件仓库](https://zhuanlan.zhihu.com/write#推荐软件仓库)中介绍。
- cache——软件下载后安装包暂存目录。
- persit——用于储存一些用户数据，不会随软件更新而替换。
- shims——用于软链接应用，使应用之间不会互相干扰，实际使用过程中无用户操作不必细究。

scoop有很多功能可以自行上网查看，这里只用几个最基本的需要用到的

- install——安装软件。
- uninstall——卸载软件。
- update——更新软件。可通过`scoop update *`更新所有已安装软件，或通过`scoop update`更新所有软件仓库资料及Scoop自身而不更新软件。

比如需要安装git只需要在powershell中输入命令`scoop install git`即可

scoop + 命令 + 软件名称

 卸载的话就用`scoop uninstall git`



#### 2.3.2 安装之后

安装之后用`scoop update`进行更新

之后用`scoop bucket 仓库名 `添加仓库

常用的有以下几个

```powershell
main
extras
versions
nightlies
nirsoft
php
nerd-fonts
nonportable
java
games
jetbrains
```

咱们需要用的默认的main和extras可以根据自己需要添加，如：

```powershell
scoop bucket main

scoop bucket extras

scoop bucket java
```

main是默认的extras里面有大量的常用的软件java的就是提供java的一些工具

添加仓库之后用`scoop update`更新

之后开始安装软件



这里推荐用一个`scoop install aria2`用来加速下载的

如果报错的话用下面的命令关闭aria2

```powershell
scoop config aria2-enabled false
```

同理改成true即可开启

```powershell
scoop config aria2-enabled true
```



用`scoop list`可以查看已经安装的程序

之后记住scoop install 和scoop uninstall就可以了其他的命令功能可以上官网自行查看这里用不到



## 3. 程序安装

1. zip

   首先安转一些小工具

   ```powershell
   scoop install git
   scoop install 7zip
   scoop install aria2
   scoop install sudo
   scoop install wget
   scoop install unzip
   scoop install gzip
   scoop install ripgrep
   ```

   

2. nodejs

   需要nodejs的环境

   ```powershell
   scoop install nodejs
   之后用node --version和npm --version检查安装版本
   输出版本号说明安装成功
   ```

   windows的话可能需要重启一下环境变量才会生效

   重启之后用npm --version查看输出版本号说明安装成功

   之后用npm安装一下wsl-open`npm install -g wsl-open`

   以后wsl的话用的到

3. fd-find

   fd-find（`npm install -g fd-find`）

   + 需要node.js环境
   + 可以用`scoop install fd`之后在neovim里面`:checkhealth`一下看看

   windows的话用`scoop install fd`即可

4. lazygit

   git管理器`scoop install lazygit`

5. 安装python

   windows的话直接去官网下载安装程序运行安装程序即可

   可以参考这个

   [全网最详细的Python安装教程（Windows） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/344887837)

   主要就是安装python添加环境变量打开powershell之后输入python --version输出版本号书名成功了

   

6. python的环境

   需要在安装完Python之后

   `sudo pip3 install --upgrade pynvim`

7. llvm-mingw下载

   可以到官网直接下载gcc的话用gdb调试体验不是很好所以这里用lldb

   [Downloads - MinGW-w64](https://www.mingw-w64.org/downloads/)

   直接到github上下载llvm-mingw（推荐）

   [Releases · mstorsjo/llvm-mingw (github.com)](https://github.com/mstorsjo/llvm-mingw/releases)

   ![image-20220926132215566](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220926132215566.png)

ucrt更通用i686是32位x86_64是64位根据自己电脑下载有macos和ubuntu的版本

这里用的windows直接下载最后

![image-20220926132407028](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220926132407028.png)这个就可以了



下载之后解压放在D盘或者其他盘里面记住路径

之后添加系统环境变量，直接win+i打开设置然后搜索环境变量



![变量](E:\github\neovimBeginCpp\变量.png)

搜索打开环境变量

![编辑变量](E:\github\neovimBeginCpp\编辑变量.png)

![1](E:\github\neovimBeginCpp\1.png)

点击path->编辑

![2](E:\github\neovimBeginCpp\2.png)

之后先点新建然后点浏览

![3](E:\github\neovimBeginCpp\3.png)

在浏览文件夹中找到刚才解压的llvm-mingw文件夹点击bin目录

之后一路确定即可



llvm-mingw里面还包含了gcc，g++和clang一样

这里推荐用clang++编译

配置文件夹内有以一个**llvm-mingw快速使用.md**可以简单学习一下基础用法

也可以上官网看文档



补充：

[Releases · llvm/llvm-project (github.com)](https://github.com/llvm/llvm-project/releases)

llvm的github上有了windows班去github上下载llvm-win32或64位的安装程序

选择添加环境变量安装即可

优点：llvm-win用的是vs库文件需要安转vs或者安装vs的库

llvm-mingw用的是gnu的库可以用`clang -v`来查看

![屏幕截图 2022-09-27 095804](E:\github\neovimBeginCpp\屏幕截图 2022-09-27 095804.png)

msvc就是vs的链接库llvm-win默认用的就是vs的

gnu就是mingw的库llvm-mingw默认用的就是gnu的

msvc的好处是，在终端支持中文显示，但是在neovim内会utf-8乱码（个人觉得不影响-在终端使用方便）

llvm-mingw默认用的gnu的库，utf-8在vim和终端中都是英文不会乱码

用llvm-wim的msvc不管是.c还是.cpp文件都可以用clang编译

但是gnu的.cpp必须用clang++编译

win和mingw二选一即可（推荐llvm-win（msvc））

这里的配置用的也是llvm-win的

可以用<F5>一键编译.c/.cpp文件

<F4>一键编译调试文件

![image-20220927102649681](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220927102649681.png)

！！！改用llvm-mingw用Target：gnu的库用msvc的在使用lldb调试的时候打断点会报错

用mingw的的话编译c++需要用clang++

在nvim文件夹内的lua文件夹下keybindings.lua的最后

![image-20220927103047402](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220927103047402.png)

大概三百多行的位置将clang改为clang++即可如果是.c文件用clang即可

或者java改成javac等等都可以自行安排

默认是clang++用来编译cpp文件



<F5>一键编译之后用快捷键tt（中）或tb（右）或tc（下）打开一个终端窗口（位置不同）

用编译好的.exe的名称回车即可运行

powershell的格式是.\a.exe也可以输入文件(.exe)名称如`a`之后按<TAB>自动补全也可以

或者用-o改名如`clang++ hello.cpp -o test.exe`即可编译生成hello.exe文件

之后`hello`按<TAB>自动补全`.\hello.exe`回车运行输出结果

默认<F5><F4>的名称为a.exe



到这里基本所有需要的程序就都已经安装完毕了



## 4. 运行neovim

将配置文件夹中的nvim文件夹复制粘贴到C盘C:\用户\用户名称\AppData\Local

整个文件夹复制进来（linux下的可以用.config文件夹）

之后在wt中打开neovim用nvim回车即可

第一次打开会自动安装packer插件管理器不用管等待安装完成即可

如果没有成功查看一下网络打开fastgithub

安装完成之后在neovim里面用:PackerSync命令进行安装插件

安装插件也许要可以连接上github用fastgithub或者代理也可以

全都安装不上就是网络问题

如果有一两个安装不上重新运行:PackerSync即可



全部安装好后就可以直接使用了如果有报错可以在neovim中用:CheckHealth检查一下

却少什么不能用报错error可以warning

如果报错看看缺少什么安装一下即可



## 5. 自定义改动

在配置文件中nvim->lua->**keybindings.lua**文件包含快捷键以及注释可以自行更改



上述没有用到oh-my-push如果需要的话可以去微软商店下载安装

或者百度查找微软商店安装的话需要多安装几次确保安装没有问题

之后在powershell中用notepad 打开配置文件

`notepad $PORFILE`打开配置文件

将配置文件夹中的**Microsoft.PowerShell_profile.ps1**打开全部复制粘贴到里面

然后保存关闭在powershell中运行`.$PROFILE`加载一下即可



在oh-my-push中`Get-PoshThemes`可以查看所有主题

选一款自己喜欢的记住名字![oh](E:\github\neovimBeginCpp\oh.png)

之后用`notepad $PORFILE`打开配置文件将圈出来的地方改为自己喜欢的主题的名字即可

保存关闭后用`.$PROFILE`重新加载



可以方向键的右键->补全历史命令用ctrl+->部分补全



在nvim->lua->plugin-config->**dashboard.lua**可以更改自己喜欢的开机界面

![image-20220927112239906](C:\Users\29033\AppData\Roaming\Typora\typora-user-images\image-20220927112239906.png)

![屏幕截图 2022-09-27 11](E:\github\neovimBeginCpp\屏幕截图 2022-09-27 11.png)

![屏幕截图 2022-09-27 112158](E:\github\neovimBeginCpp\屏幕截图 2022-09-27 112158.png)

都可以更改，样式会显示最后一个把最后一个删了或更改即可





至此全部配置完成可以将下载的配置文件夹删除了

可以实现代码补全，跳转，提示以及编译

调试的话用的vimspector但是没有配置完全

这里直接用的lldb去进行调试也是不错的后续有机会会更新



由于水平有限只能手动安装程序，有实力的选手可以自己写一个安装脚本一键安装



