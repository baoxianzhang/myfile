#!/usr/bin/env bash
echo "This Shell script will turn relative path to abs path or inverse in input markdown file."
echo "USAGE:"
echo "$0 input_markdown_file output_markdown_file"
echo ""
echo ""
if [ $# -ne 2 ];
then
  echo "Error: the input param is not equal to 2!"
  exit
fi

# copy the file content to the output file
cat $1 > $2

this_dir=$(pwd)

img_string=$(grep -E ".png|.jpg|.jpeg" $1)
echo "$img_string" | while read line; do
  echo ${line}
  if [[ ${line} =~ '![' ]]
  then
    echo "![] mode ----------------------------------------------------"
    string_bracket=${line#*(}
    string_in_bracket=${string_bracket%)*}
    echo "string_in_bracket: ${string_in_bracket}"
    ## TODO /home in header,  determing the abs or relative if "/home" in string_in_bracket, consider as file with absolute file
    if [[ ${string_in_bracket} =~ '/home' ]]
    then
      echo "abs -> relative--------------------------------------------"
      last_string=${string_in_bracket##*/}
      relative_string=$(find ./ -name ${last_string})
      ## TODO whatif find with several result just chose the first one
      echo "${relative_string}" | while read one_relative_file; do
        relative_file=${one_relative_file#*/}
        echo "${string_in_bracket} -> ${relative_file}"
        sed -i "s#${string_in_bracket}#${relative_file}#g" $2
        break
      done
    else
      echo "relative -> abs--------------------------------------------"
      absolute_file=${this_dir}/${string_in_bracket}
      ## here can be sure to find only one result
      echo "${string_in_bracket} -> ${absolute_file}"
      sed -i "s#${string_in_bracket}#${absolute_file}#g" $2
    fi
  fi
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  if [[ ${line} =~ '<img' ]]
  then
    echo "<img mode ---------------------------------------------------"
    src_content=$(echo ${line} | sed 's/ /\n/g' | grep "src=")
    echo ${src_content}
    string_in_quote1=${src_content#*\"}
    string_in_quote=${string_in_quote1%\"*}
    echo "string_in_quote: ${string_in_quote}"
    ## TODO /home in header,  determing the abs or relative if "/home" in string_in_bracket, consider as file with absolute file
    if [[ ${string_in_quote} =~ '/home' ]]
    then
      echo "abs -> relative--------------------------------------------"
      last_string=${string_in_quote##*/}
      relative_string=$(find ./ -name ${last_string})
      ## TODO whatif find with several result just chose the first one
      echo "${relative_string}" | while read one_relative_file; do
        relative_file=${one_relative_file#*/}
        echo "${string_in_quote} -> ${relative_file}"
        sed -i "s#${string_in_quote}#${relative_file}#g" $2
        break
      done
    else
      echo "relative -> abs--------------------------------------------"
      absolute_file=${this_dir}/${string_in_quote}
      ## here can be sure to find only one result
      echo "${string_in_quote} -> ${absolute_file}"
      sed -i "s#${string_in_quote}#${absolute_file}#g" $2
    fi
  fi
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
done
echo "Finish the transform in markdown!"
