@echo off
echo %1
echo %2
net user %1 %2 /add
pause