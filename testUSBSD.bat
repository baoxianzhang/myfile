@echo off
echo set sh=WScript.CreateObject("WScript.Shell") >telnet_tmp.vbs
echo WScript.Sleep 300 >>telnet_tmp.vbs
echo sh.SendKeys "open 192.168.8.1 23 {ENTER}" >>telnet_tmp.vbs
echo WScript.Sleep 1000 >>telnet_tmp.vbs
echo sh.SendKeys "ls /dev/sd[a-c]1 {ENTER}">>telnet_tmp.vbs
start telnet
cscript //nologo telnet_tmp.vbs
del telnet_tmp.vbs
