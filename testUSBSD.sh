#! /usr/bin/env sh
(
    ping www.baidu.com -c 10
    sleep 1
    echo 'ls /dev/sd[a-c]1'
    sleep 1
)| telnet 192.168.8.1
