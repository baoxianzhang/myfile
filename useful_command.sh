#!/usr/bin/env sh

# https://www.toptal.com/linux/tips-and-practices
function renameFileName()
{
  oldname=$1
  newname=$2
  for file in *${oldname}*; do mv $file $(echo $file| sed -e "s/${oldname}/${newname}/g"); done
}
