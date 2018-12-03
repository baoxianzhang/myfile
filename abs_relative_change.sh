#!/usr/bin/env bash
img_string=$(grep -E ".png|.jpg|.jpeg" $1)
echo "$img_string" | while read line; do
  string_bracket=${line#*(}
  string_in_bracket=${string_bracket%)*}
  echo "string_in_bracket: ${string_in_bracket}"
  ## determing the abs or relative if "/home" in string_in_bracket, consider as file with absolute file
  if [[ ${string_in_bracket} =~ '/home' ]]
  then
    echo "===============abs========================="
    last_string=${string_in_bracket##*/}
    relative_string=$(find ./ -name ${last_string})
    echo "${relative_string}" | while read one_relative_file; do
      relative_file=${one_relative_file#*/}
      echo "relative_file ${relative_file}"
      echo "${string_in_bracket} -> ${relative_file}"
      sed -i "s#${string_in_bracket}#${relative_file}#g" $1
      break
    done
  else
    echo "===============rel========================="
    this_dir=$( cd "$( dirname "$0")" && pwd )
    absolute_file=${this_dir}/${string_in_bracket}
    ## here can be sure to find only one result
    echo "${string_in_bracket} -> ${absolute_file}"
    sed -i "s#${string_in_bracket}#${absolute_file}#g" $1
  fi
done
