#!/bin/bash

#======================================================================#
#1. find all map.in files in this directory and its sub dir.
#2. If the file has unknown or iso-8859-1 encoding convert it to UTF-8
#======================================================================#

FROM="iso-8859-1"
TO="UTF-8"

for file in $(find . -type f |grep ".map.in")
do
  echo "$file"
  temp="temp.map.in"
  if file -i $file | grep $FROM || file -i $file | grep "unknown-8bit"
  then
    iconv -f $FROM -t $TO $file > $temp
    mv $temp $file
    echo ": converted to UTF-8."
  else
    echo ": not iso-8859-1; nothing to convert."
  fi
done
