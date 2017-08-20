#! /bin/bash
# Bash script that purges all installed kerneles which have
# a lower ABI number than the currently running base kernel.
# This fixes an issue with Ubuntu 14.04 running with full-disk
# encryption or where /boot volume fills up on regular basis.

# Base on https://github.com/kernoelpanic/FreeSpaceOnBoot

kernelver=$(uname -r | sed -r 's/-[a-z]+//')
kernelbase=$(echo ${kernelver} | cut -d'-' -f1)
kernelabi=$(echo ${kernelver} | cut -d'-' -f2)

# otherkernels
otherkernels=$(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve ${kernelver})
# kernels using apt-get remove before, not clear clean
otherkernels_deinstall=$(dpkg --get-selections | grep linux-image-"[0-9]*" | grep "deinstall" | awk '{print $1}')

echo "Current kernel version        : ${kernelver}"
echo "Current base kernel version   : ${kernelbase}"
echo "Current kernel ABI number     : ${kernelabi}"
echo "Additionaly installed kernels :"
echo $otherkernels  | sed 's/\ /\n/g'
echo "Additionaly deinstall kernels :"
echo ${otherkernels_deinstall} | sed 's/\ /\n/g'

echo "Kernel(s) that will be removed:"
echo ${otherkernels} | sed 's/\ /\n/g'

echo "Remove addtional kernels?"
select yn in "yes" "no"; do
    case $yn in
        yes)
            sudo apt-get purge ${otherkernels}
            sudo dpkg -P ${otherkernels_deinstall}
            break;;
        no)
            echo "do nothing"
            break;;
    esac
done
