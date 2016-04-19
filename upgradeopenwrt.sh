#! /bin/bash
#Author: lin jiahui; baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
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
doc_dir=${file_dir}/molmc_doc/src/content/zh/
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
fi

cecho "<<<<<< Upload the openwrt-ramp bin to baiduyun pan and box! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "The baiduyun pan url:" $green
    cecho "http://yun.baidu.com/?ref=PPZQ" $blue
    cecho "The box url:" $green
    cecho "https://app.box.com/login" $blue
    cecho "The account:" $green
    cecho "developer@molmc.com" $blue
    cecho "add the share link to the file baidupanboxsharelink "
    cd ${pub_dir}/${date_dir}
    echo "baiduyunpan:" > baidupanboxsharelink
    echo "" >> baidupanboxsharelink
    echo "box:" >> baidupanboxsharelink
    echo "" >> baidupanboxsharelink
    gedit baidupanboxsharelink
fi

cecho "<<<<<< Fix the link in the molmc_doc! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ${doc_dir}
    git pull --rebase
    link_file=${pub_dir}/${date_dir}/baidupanboxsharelink
    connect_file=${doc_dir}/src/content/zh/connect.md
    keystring="下载Atom官方固件"
    #取出国内网址，并将'/'修改为'\/'
    guonei=$(sed -n -e '/baiduyunpan:/N;s/.*\n\(.*\)/\1/p' $link_file)
    guonei=$(echo ${guonei} | sed "s:\/:\\\/:g")

    #取出国外网址，并将'/'修改为'\/'
    guowai=$(sed -n -e '/box:/N;s/.*\n\(.*\)/\1/p' $link_file)
    guowai=$(echo ${guowai} | sed "s:\/:\\\/:g")

    sed -i "/${keystring}/s/([^)]*)/(${guonei})/1" ${connect_file}
    sed -i "/${keystring}/s/([^)]*)/(${guowai})/2" ${connect_file}
    git add .
    git commit -m "update the link of openwrt firmware"
    git push
fi

cecho "<<<<<< Test the link in the 45 platform! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Follow the steps bellow:" $green
    cecho "1. Login luozheng 45 &&  cd ~/workspace/molmc_docs/ && git pull --rebase && grunt server" $blue
    cecho "2. Test in the web url: 192.168.0.45.9999" $blue
    cecho "Enter to continue!" $green
    read nothing
    sshpass -p luozheng ssh luozheng@192.168.0.45
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

cecho "<<<<<< tar the file and scp to intorobot! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Follow the steps:" $green
    cecho "1. tar -czvf ${openwrt_ver}.${configbag_ver}.tar.gz ${openwrt_ver}.${configbag_ver}" $blue
    cecho "2. scp ${openwrt_ver}.${configbag_ver}.tar.gz root@115.29.193.81:/tmp/" $blue
    cd ..
    tar -cvzf ${openwrt_ver}.${configbag_ver}.tar.gz ${openwrt_ver}.${configbag_ver}
    cecho "upload to the bellow url:" $green
    cecho "http://www.intorobot.com/downloads/atom/" $blue
    cecho "112.124.117.64/downloads/atom/" $blue
    #nautilus ./
    scp ${openwrt_ver}.${configbag_ver}.tar.gz root@115.29.193.81:/tmp/ 
    scp ${openwrt_ver}.${configbag_ver}.tar.gz root@112.124.117.64:/tmp/ 
fi


cecho "<<<<<< Set the openwrt verison in the intorobot platform! >>>>>>" $yellow
cecho "http://wiki.intorobot.com:8080/" $green
cecho "112.124.117.64:8080" $green

