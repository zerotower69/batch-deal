# 说明

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

批处理的算术运算规则()  */%+-

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
