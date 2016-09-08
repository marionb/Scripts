#!/bin/bash


#======================================================================#
#1. find all .map.in files in this dir and its sub dirs
#2. move all the files found in 1 to .map.mako
#======================================================================#
echo "moving .in --> .mako"

for file in $(find . -type f |grep ".map.in")
do
 echo "- $file"
 mv "$file" "${file%.in}.mako"
done
