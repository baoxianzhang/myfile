#! /bin/bash
#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 10-04-2016
#

function askForContinue()
{
    read ANS
    case $ANS in
        y|Y|yes|YES)
            echo 1
            ;;
        n|N|no|NO)
            echo 0
            ;;
    esac
}
# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal + without clearing screen.
#alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo -e "${2}${1}"
  tput sgr0
  # Reset # Reset to normal.
  return
}

file_dir=$(cd "$(dirname "$0")"; pwd)
#file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )

cecho "file_dir=${file_dir}" $green
openwrt_dir=${file_dir}/openwrt
pub_dir=${file_dir}/pub
openwrt_binname=openwrt-ramips-mt7620-atom-squashfs-sysupgrade

cecho "<<<<<< Enter the Information about the upgrade! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ]; then
    cecho "Enter the pub date:" $green
    read date_dir
    cecho "Enter the openwrt ver:" $green
    read openwrt_ver
    cecho "Enter the configbag ver:" $green
    read configbag_ver
fi

cecho "<<<<<<< Compile openwrt! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ${openwrt_dir}
    make j=4
    cecho "Compile finish!" $green
fi

cecho "<<<<<< Copy openwrt-ramips-atom bin to pub dir! Continue?[Y/n] >>>>>> " $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "${pub_dir}/${date_dir}" ]; then
        mkdir ${pub_dir}/${date_dir}
    fi
    cp ${openwrt_dir}/bin/ramips/${openwrt_binname}.bin ${pub_dir}/${date_dir}/${openwrt_binname}-${openwrt_ver}.${configbag_ver}.bin
    if [ ! -d "${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}" ]; then
        mkdir ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}
    fi
    cp ${pub_dir}/${date_dir}/${openwrt_binname}-${openwrt_ver}.${configbag_ver}.bin ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}/openwrt-ramips-${openwrt_ver}.bin
    cd ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}
    md5sum openwrt-ramips-${openwrt_ver}.bin > md5sums
    sed -i "s/  openwrt-ramips-${openwrt_ver}.bin/ \*openwrt-ramips-${openwrt_ver}.bin/g" `grep 'openwrt-ramips' -rl .`
    cd ..
    tar -cvzf ${openwrt_ver}.${configbag_ver}.tar.gz ${openwrt_ver}.${configbag_ver}
    cecho "upload to the bellow url:" $green
    cecho "http://www.intorobot.com/downloads/atom/"
    nautilus ./
fi

cecho "<<<<<< Upload the openwrt-ramp bin to baiduyun pan and box! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "The baiduyun pan url:" $green
    cecho "http://yun.baidu.com/?ref=PPZQ" $blue
    cecho "The box url:" $green
    cecho "https://app.box.com/login" $blue
    cecho  "The account:" $green
    cecho "developer@molmc.com" $blue
fi

cecho "<<<<<< Fix the link in the molmc_doc! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    echo "Wait and good!"
fi

cecho "<<<<<< make the openwrt configbag! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Follow the steps:" $green
    cecho "1. Login openwrt" $blue
    cecho "2. vim /etc/sysupgrade.conf" $blue
    cecho "3. add /root/intorobot/default-firmware/default-firmware.bin" $blue
    cecho "4. sysupgrade -i -v -b config-10.tar.gz" $blue
    cecho "5. Select y, and delete all but the lines you add and /etc/sysupgrade.conf" $blue
    cecho "6. config-10.tar.gz bag is already in the your local dir" $blue
    cecho "7. If run, sysupgrade -r config-10.tar.gz" $blue
    cecho "8. cp out config-10.tar.gz to pub_dir" $blue
fi

cecho "<<<<<< Copy configbag! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Follow the steps:" $green
    cecho "1. cp config-10.tar.gz to ${date_dir} dir" $blue
    cecho "2. md5sum config-10.tar.gz >> md5sums" $blue
    cecho "3. add * in md5sums" $blue
fi
