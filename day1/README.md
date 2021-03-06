# 说明

测试的操作系统：win10专业版1903
每个命令会为了方便使用 命令+/?的方式让大家可以直接看到系统的提示

---
==day1==
==windows系统不区分大小写==

```shell

@echo off
@echo on 
echo 
start "xxx"  #打开名为xx的新窗口
net user #查看当前的所有用户
cls #清屏操作
ipconfig #win的查看网卡信息
```

```shell
#windows常用的小工具
calc 计算器
notepad 记事本
write  写字板
mspaint 画图
magnify 放大镜
osk 屏幕键盘
charmap 字符映射表
eudcedit 字符制造工具
mstsc 远程连接
sndvol  调节音量
###########################
taskmgr  # 任务管理器
perfmon.msc  #资源监视器
winver #c查看windows的版本
explorer #资源管理器
```

==上述内容之后会陆续补充==

## 批处理的算术运算规则

()  */%+-

```shell
set /a 1+3  #计算1+3
## 优先级通过括号来修改
```

## 重定向操作运算

流的方向

```shell
echo "hello world" >a.txt
## 在当前目录下创建a.txt(如果不存在的话)
#输入 “hello world" 
#注意 一个”>"号覆盖所有  要想达到追加的效果必须是 “>>"

```

## 多命令运算符

使用 ”&&“ 或者 "||"执行

```shell
ipconfig && net user

iaafsad || net user
```

## 管道运算

管道符号 “|" (竖线)

```shell
#寻找所有目录下的txt文件
dir | find ".txt"
```

## 批处理的基本命令

==以下的操作只有在管理员模式下才可以成功==
==如何使用帮助==

命令格式： 命令 子命令 参数
例如：添加新的用户，你可以：

```shell
net user test test /add
# 解释： net:命令 user: 子命令   test test 分别是参数（用户名和密码）  /add 是操作选项
```

可通过 /？和 /help来参看详细的命令操作。

## 批处理接受参数

在 user.bat

```shell
@echo off
echo %1
echo %2

net user %1 %2 /add
pause
```

## 注释符拓展

```shell
## 炫酷的命令提示符
rem  dddd
```

```shell
color # 切换前景和后景的颜色 第一个参数后景 第二个前景
color /? #可以查看所有的颜色提示
COLOR 20 #可以切换为前景是黑色的字体，后景是绿色。
title #修改cmd窗口的标题
tile /?  
########################
设置命令提示窗口的窗口标题。

TITLE [string]

  string       指定命令提示窗口的标题。
#########################
```

## 时间相关的命令

```shell
date  
#############################
当前日期: 2020/10/10 周六
输入新日期: (年月日)
############################
time 
############################
当前时间: 15:36:38.35
输入新时间:
###########################
```

## 启动命令

```shell
start #这个命令将启动一个新的窗口
start /B  #这个命令将不启动一个新的窗口
```

## 调用其他的bat文件

```shell
call #调用其它的bat
####################
call 1.bat
##################
# 调用的时候不可以参数传递
```

## 任务列表查看

```shell
tasklist #查看所有的正在运行的进程  （.exe)
# 筛选器
tasklist /FI "STATUS eq RUNNING" 
#查看所有处于”RUNNING"状态的任务
```

## 任务关闭命令

```shell
taskkill
taskkill /IM notepad.exe
#向所有的记事本进程发送关闭的信号
####################
成功: 给进程 "notepad.exe" 发送了终止信号，进程的 PID 为 18220。
成功: 给进程 "notepad.exe" 发送了终止信号，进程的 PID 为 12284。
####################
# 有时候使用/F来强制关闭
# /T关闭进程和相对应的子进程
# 近期在使用idea开发应用就碰到了进程占用无法关闭的问题
#结合tasklist和taskkill可完美地解决
```

## 文件结构 tree

```shell
tree /?
#####################
以图形显示驱动器或路径的文件夹结构。

TREE [drive:][path] [/F] [/A]

   /F   显示每个文件夹中文件的名称。
   /A   使用 ASCII 字符，而不使用扩展字符。

#####################
```

由于图片不好展示
在我的test文件夹test中有一个子文件夹 a
和 1.txt 和2.txt
使用tree

```shell
tree /a /f
#######################
卷 OS 的文件夹 PATH 列表
卷序列号为 E446-BBB0
C:.
|   1.txt
|   2.txt
|
\---a
#######################
# 假设我在a子文件夹下新建一个a.txt
tree /a /f
######################
卷序列号为 E446-BBB0
C:.
|   1.txt
|   2.txt
|
\---a
        a.txt
######################
```

## 关机命令

```shell
shutdown /?
########################################
用法: shutdown [/i | /l | /s | /sg | /r | /g | /a | /p | /h | /e | /o] [/hybrid] [/soft] [/fw] [/f]
    [/m \\computer][/t xxx][/d [p|u:]xx:yy [/c "comment"]]

    没有参数   显示帮助。这与键入 /? 是一样的。
    /?         显示帮助。这与不键入任何选项是一样的。
    /i         显示图形用户界面(GUI)。
               这必须是第一个选项。
    /l         注销。这不能与 /m 或 /d 选项一起使用。
    /s         关闭计算机。
    /sg        关闭计算机。在下一次启动时，如果启用了
               自动重启登录，则将自动登录并锁定上次交互用户。
               登录后，重启任何已注册的应用程序。
    /r         完全关闭并重启计算机。
    /g         完全关闭并重启计算机。重新启动系统后，
               如果启用了自动重启登录，则将自动登录并
               锁定上次交互用户。
               登录后，重启任何已注册的应用程序。
    /a         中止系统关闭。
               这只能在超时期间使用。
               与 /fw 结合使用，以清除任何未完成的至固件的引导。
    /p         关闭本地计算机，没有超时或警告。
               可以与 /d 和 /f 选项一起使用。
    /h         休眠本地计算机。
               可以与 /f 选项一起使用。
    /hybrid    执行计算机关闭并进行准备以快速启动。
               必须与 /s 选项一起使用。
    /fw        与关闭选项结合使用，使下次启动转到
               固件用户界面。
    /e         记录计算机意外关闭的原因。
    /o         转到高级启动选项菜单并重新启动计算机。
               必须与 /r 选项一起使用。
    /m \\computer 指定目标计算机。
    /t xxx     将关闭前的超时时间设置为 xxx 秒。
               有效范围是 0-315360000 (10 年)，默认值为 30。
               如果超时时间大于 0，则默示为
               /f 参数。
    /c "comment" 有关重新启动或关闭的原因的注释。
               最多允许 512 个字符。
    /f         强制关闭正在运行的应用程序而不事先警告用户。
               如果为 /t 参数指定大于 0 的值，
               则默示为 /f 参数。
    /d [p|u:]xx:yy  提供重新启动或关闭的原因。
               p 指示重启或关闭是计划内的。
               u 指示原因是用户定义的。
               如果未指定 p 也未指定 u，则重新启动或关闭
               是计划外的。
               xx 是主要原因编号(小于 256 的正整数)。
               yy 是次要原因编号(小于 65536 的正整数)。

此计算机上的原因:
(E = 预期 U = 意外 P = 计划内，C = 自定义)
类别    主要    次要    标题

 U      0       0       其他(计划外)
E       0       0       其他(计划外)
E P     0       0       其他(计划内)
 U      0       5       其他故障: 系统没有反应
E       1       1       硬件: 维护(计划外)
E P     1       1       硬件: 维护(计划内)
E       1       2       硬件: 安装(计划外)
E P     1       2       硬件: 安装(计划内)
E       2       2       操作系统: 恢复(计划外)
E P     2       2       操作系统: 恢复(计划内)
  P     2       3       操作系统: 升级(计划内)
E       2       4       操作系统: 重新配置(计划外)
E P     2       4       操作系统: 重新配置(计划内)
  P     2       16      操作系统: Service Pack (计划内)
        2       17      操作系统: 热修补(计划外)
  P     2       17      操作系统: 热修补(计划内)
        2       18      操作系统: 安全修补(计划外)
  P     2       18      操作系统: 安全修补(计划内)
E       4       1       应用程序: 维护(计划外)
E P     4       1       应用程序: 维护(计划内)
E P     4       2       应用程序: 安装(计划内)
E       4       5       应用程序: 没有反应
E       4       6       应用程序: 不稳定
 U      5       15      系统故障: 停止错误
 U      5       19      安全问题(计划外)
E       5       19      安全问题(计划外)
E P     5       19      安全问题(计划内)
E       5       20      网络连接丢失(计划外)
 U      6       11      电源故障: 电线被拔掉
 U      6       12      电源故障: 环境
  P     7       0       旧版 API 关机
############################################
可以使用 shutdowm /i 命令来打开远程控制，远程关闭计算机（同一局域网内)

```
