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
