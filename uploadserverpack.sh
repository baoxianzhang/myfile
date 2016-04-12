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
atom_dir=${file_dir}/intorobot_atom

cecho "<<<<<< Make realease pack of  intorobot_atom and upload to intoyun for test! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ${atom_dir}
    make clean
    make clean_server_pack
    git pull --rebase
    make release_server_pack
    cecho "cp intorobot_stm32_server.tar.gz to intoyun" $green
    scp out/intorobot_stm32_server.tar.gz root@112.124.117.64:/tmp/
    cecho "Follow the following steps to install the pack" $green
    cecho "1. Login intoyun" $blue
    cecho "2. cd /var/" $blue
    cecho "3. run firmware_install.sh" $blue
    cecho "Enter to continue!" $green
    read nothing
    ssh root@112.124.117.64
fi

cecho "<<<<<< Upload sever.tar.gz to intorbot platform! Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ -f "${atom_dir}/out/intorobot_stm32_server.tar.gz" ]; then
        cd ${atom_dir}
        make clean
        make clean_server_pack
        git pull --rebase
        make release_server_pack
    fi
    scp out/intorobot_stm32_server.tar.gz root@115.29.193.81:/tmp/
fi

