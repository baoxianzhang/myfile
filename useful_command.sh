#!/usr/bin/env sh

# https://www.toptal.com/linux/tips-and-practices
function renameFileName()
{
  oldname=$1
  newname=$2
  for file in *${oldname}*; do mv $file $(echo $file| sed -e "s/${oldname}/${newname}/g"); done
}

# https://itsfoss.com/speed-up-ubuntu-1310/
## Reduce the default grub load time
# sudo vim /etc/default/grub
# change GRUB_TIMEOUT=10 to GRUB_TIMEOUT=2
# sudo update-grub

## Install preload to speed up application load time
# sudo apt-get install preload

## Use apt-fast instead of apt-get for a speedy update
# sudo add-apt-repository ppa:apt-fast/stable
# sudo apt-get update
# sudo apt-get install apt-fast

## Remove language related ign from apt-get update:
## Reduce overheating
