#! /bin/bash
#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 20160608
#

function askForContinue()
{
    read ANS
    case $ANS in
        n|N|no|NO)
            echo 0
            ;;
        *)
            echo 1
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
openwrt_dir=${file_dir}/openwrtgithub
pub_dir=${file_dir}/pub
atom_dir=${file_dir}/firmware
ota_pub_dir=${file_dir}/ota

openwrt_binname=openwrt-ramips-mt7620-atom-squashfs-sysupgrade
intoyun_webip="112.124.117.64"
intorobot_webip="115.29.193.81"
platform_webip=$intoyun_webip

echo ""
cecho "!!!!!!!!Attention: rememeber to modify the openwrt sys_ver. !!!!!!!!!!" $red 
cecho "!!!!!!!!Attention: rememeber to modify the stm32 firmware_ver. !!!!!!!!!!" $red 
cecho "!!!!!!!!Attention: make sure all the code is the newest. !!!!!!!!!!" $red 
echo ""

cecho "<<<<<< Enter the Information about the upgrade! Continue?[Y/n] >>>>>>" $yellow
#ans=$(askForContinue)
#if [ $ans == 1 ]; then
cecho "Enter the platform {intoyun}:" $green
read platform
cecho "Enter the pub date {20160721}:" $green
read date_dir
cecho "Enter the openwrt ver {3.6.6}:" $green
read openwrt_ver
configbag_ver=0
#fi

if [ $platform == "intoyun" ];then
    platform_webip=$intoyun_webip
elif [ $platform == "intorobot" ];then
    platform_webip=$intorobot_webip
fi

if [ $platform == "intoyun" ];then
    cecho "<<<<<<< Compile atom stm32 firmware and cp to openwrt bin! Continue?[Y/n] >>>>>>" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cd ${atom_dir}
        make PLATFORM=atom clean all
        cecho "Compile finish!" $green
        cecho "<<<<<<< cp to openwrt bin! Continue?[Y/n] >>>>>>" $yellow
        ans=$(askForContinue)
        if [ $ans == 1 ];then
            cp ./build/target/main/platform-0/default-atom.bin $openwrt_dir/files/root/intorobot/default-firmware/default-firmware.bin
            cecho "copy finish!" $green
        fi
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
            cp ${openwrt_dir}/bin/ramips/${openwrt_binname}.bin ${pub_dir}/${date_dir}/openwrt-ramips-mt7620-atom${openwrt_ver}.${configbag_ver}.bin
            if [ ! -d "${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}" ]; then
                mkdir ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}
            fi
            cp ${pub_dir}/${date_dir}/openwrt-ramips-mt7620-atom${openwrt_ver}.${configbag_ver}.bin ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}/openwrt-ramips-${openwrt_ver}.bin
            cd ${pub_dir}/${date_dir}/${openwrt_ver}.${configbag_ver}
            md5sum openwrt-ramips-${openwrt_ver}.bin > md5sums
            sed -i "s/  openwrt-ramips-${openwrt_ver}.bin/ \*openwrt-ramips-${openwrt_ver}.bin/g" `grep 'openwrt-ramips' -rl .`
        fi

    cecho "<<<<<< tar the openwrt version file! Continue?[Y/n] >>>>>>" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cd ${pub_dir}/${date_dir}
        tar -cvzf ${openwrt_ver}.${configbag_ver}.tar.gz ${openwrt_ver}.${configbag_ver}
    fi
fi

cecho "<<<<<<< cp base_intorobot.tar.gz to platform /tmp! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ${ota_pub_dir}
    ./ota_release.sh
    if [ $platform == "intoyun" ];then
        cecho "Now ssh intoyun && ./atomNeutronInstall.sh" $green
        ./ota_release.sh publish
    elif [ $platform == "intorobot" ];then
        cecho "Tell zhongjin to update the release_server_pack to intorobot" $red
    fi
fi

cecho "<<<<<< scp openwrt version tar.gz  to platform /tmp! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ${pub_dir}/${date_dir}
    scp ${openwrt_ver}.${configbag_ver}.tar.gz root@$platform_webip:/tmp/
    cecho "scp finish!" $green

    if [ $platform == "intoyun" ];then
        cecho "Now ssh intoyun && cd /var/www/downloads/atom/" $green
        cecho "tar -xzvf /tmp/${openwrt_ver}.${configbag_ver}.tar.gz" $green
        ssh root@112.124.117.64
    elif [ $platform == "intorobot" ];then
        cecho "Tell zhongjin to upload the openwrt bag to intorobot" $red
    fi
fi

cecho "<<<<<< Set the openwrt verison in the platform! >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ $platform == "intoyun" ];then
        cecho "The intoyun platform:" $green
        cecho "112.124.117.64:8080" $green
        cecho "The admin: admin@intorobot.com" $green
    elif [ $platform == "intorobot" ];then
        cecho "The intorobot platform:" $green
        cecho "http://wiki.intorobot.com:8080/" $green
        cecho "The admin: admin@intorobot.com" $green
    fi
fi

if [ $platform == "intorobot" ]; then
    cecho "<<<<<< Upload the openwrt-ramp bin to baiduyun pan and box! Continue?[Y/n] >>>>>>" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cecho "The baiduyun pan url:" $green
        cecho "http://yun.baidu.com/?ref=PPZQ" $blue
        cecho "The box url:" $green
        cecho "https://app.box.com/login" $blue
        cecho "The account:" $green
        cecho "developer@molmc.com" $blue
    fi

    cecho "<<<<<< Final check the things and send email to the relative people! >>>>>>" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cecho "Check the following things:" $green
        cecho "1. update INTOROBOT_FIRMWARE_LIB_VER;" $red
        cecho "2. release server pack to the intorobot platform;" $blue
        cecho "3. release openwrt bag to the intorobot platform;" $blue
        cecho "5. git push the openwrt and atom code;" $blue
        cecho "6. release and tag the code;" $blue
        cecho "7. Record the log of atom and openwrt in the ${pub_dir}/${date_dir}." $blue
        ans=$(askForContinue)
        if [ $ans == 1 ];then
            echo "openwrt log and version:" > openwrtatomlog
            echo "1." >> openwrtatomlog
            echo "2." >> openwrtatomlog
            echo "" >> openwrtatomlog
            echo "atom log and version:" >> openwrtatomlog
            echo "1." >> openwrtatomlog
            echo "2." >> openwrtatomlog
            echo "" >> openwrtatomlog
            gedit ${pub_dir}/${date_dir}/openwrtatomlog
        fi
        cecho "8. Send email to the relatvie people." $blue
    fi
fi
