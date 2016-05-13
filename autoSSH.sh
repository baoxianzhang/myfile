#!/usr/bin/expect
#spawn ssh-keygen -f "/home/zhangbaoxian/.ssh/known_hosts" -R 192.168.8.1
spawn ssh-keygen -f "~/.ssh/known_hosts" -R 192.168.8.1
interact
spawn ssh root@192.168.8.1
expect "*yes*"
send "yes\r"
expect "*password:"
send "intorobot\r"
expect "#*"
send "ls /tmp/mounts\r"
interact
