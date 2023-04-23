# 利用lldb调试

Low Level Debugger

指的是轻量级调试器不是低级

clang++ 和clang 编译

`clang++ filename.cpp -o neme`

clang（如果是c++就用clang++） + 文件名称 + -o（重命名） 名字

如果直接用clang++ + 文件名

默认输出的为a.exe

和gcc，g++类似

相对于gdb来说lldb是下一代跟好用

lldb主要用于调试c，cpp和objective-c





# 下载安装

windows中用的`llvm-mingw`在github中下载解压之后将bin目录添加到系统环境变量中，包含g++和gcc默认用clang



# 调试使用

## 1. 运行断点

编译用`clang++ test.cpp`编译程序

调试时需要使用-g参数`clang++ -g test.cpp`

仓库中的快捷键<F5>一键编译相当于`clang++ test.cpp`

<F4>一键调试编译相当于`clang++ -g test.cpp`

也可以自行更改

！！！

！！！

！！！调试的时候要先-g编译才可以

调试的时候一定要用-g参数`clang++ -g test.cpp`或者<F4>一键调试编译

之后调试的时候才能打断点

之后运行 `lldb .\a.exe`

### 1.1 运行

用`（(lldb) run`或者`(lldb) r`运行



### 1.2 断点

```cpp
(lldb) breakpoint set -f test.cpp -l #行数
    -f 后更源文件位置 -l 之后是断点行数
(lldb) br s - f test.cpp -l #
    缩写形式
(lldb) b test.cpp : #
    简写
    
(lldb) b [函数名]
```



### 1.3 删除断点

```cpp
(lldb) br list
    列出所有断点
(lldb) br del #序号
    删除#的断点
(lldb) br del
    删除所有断点
```



## 2. 分步调试

```cpp
下一步（下一行，一行一行执行）
(lldb) next
(lldb) n
    
进入（运行到某一行n会直接下一行，用s进入函数）
（用s进入函数系统提供的如prinf不会进入，如果不是函数入口s和n功能一样）
(lldb) step
(lldb) s
    
继续（运行之后停在第一个断点的时候用c直接到下一个断点）
(lldb) continue
(lldb) c
```



## 3. 查看变量

```cpp
打印变量值
(lldb) print varname
(lldb) p varname

    如
    (lldb) p a
    输出$0 = 10
    可以用 expr $0 = 20
    改变数值
    如
    $0 = 10
    (lldb) expr $0 = 20
    会输出 $1 = 20
    
    (lldb) po varname
    只查看对象的值(只显示数值)

    
列出当前栈帧变量
(lldb) frame variable
(lldb) fr v
    
切换栈帧（用bt查看序号#）
(lldb) fr select #
(lldb) fr s #
    
调用栈
（调用的会在最上面）
（当前所在栈会有*号）
(lldb) bt
```



## 4. 监视断点

```cpp
全局变量
(lldb) watchpoint set variable [some globalVariable]
(lldb) watchpoint set variable -w read | read_write [some globalVariable]
 
局部变量
(lldb) b main
(lldb) w s v d.memberVar
    
在变量改变的时候会触发
显示old value和 new value
```



用`(lldb) w s v 关键值`进行监视，当关键值变化时会自动暂停并输出old value 和new value





## 5. 终止调试

```cpp
(lldb) kill
停止调试
    
(lldb) quit
退出lldb
或者exit或Ctrl+c（两次）
```





只列举了常用简单的一小部分

还有很多高级操作查看官网说明



# gdb调试

| 命令名称    | 命令缩写  | 命令说明                                         |
| ----------- | --------- | ------------------------------------------------ |
| run         | r         | 运行一个待调试的程序                             |
| continue    | c         | 让暂停的程序继续运行                             |
| next        | n         | 运行到下一行                                     |
| step        | s         | 单步执行，遇到函数会进入                         |
| until       | u         | 运行到指定行停下来                               |
| finish      | fi        | 结束当前调用函数，回到上一层调用函数处           |
| return      | return    | 结束当前调用函数并返回指定值，到上一层函数调用处 |
| jump        | j         | 将当前程序执行流跳转到指定行或地址               |
| print       | p         | 打印变量或寄存器值                               |
| backtrace   | bt        | 查看当前线程的调用堆栈                           |
| frame       | f         | 切换到当前调用线程的指定堆栈                     |
| thread      | thread    | 切换到指定线程                                   |
| break       | b         | 添加断点                                         |
| tbreak      | tb        | 添加临时断点                                     |
| delete      | d         | 删除断点                                         |
| enable      | enable    | 启用某个断点                                     |
| disable     | disable   | 禁用某个断点                                     |
| watch       | watch     | 监视某一个变量或内存地址的值是否发生变化         |
| list        | l         | 显示源码                                         |
| info        | i         | 查看断点 / 线程等信息                            |
| ptype       | ptype     | 查看变量类型                                     |
| disassemble | dis       | 查看汇编代码                                     |
| set args    | set args  | 设置程序启动命令行参数                           |
| show args   | show args | 查看设置的命令行参数                             |
