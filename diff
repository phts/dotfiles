#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for app in "$@"
do
  for file in $(find $app -type f)
  do
    output=`diff -r --ignore-all-space $file ~/${file#$app/}`
    if [ $? -ne 0 ]; then
      echo
      echo "$file <=> ~/${file#$app/}"
      echo "$output"
    fi
  done
done

IFS=$SAVEIFS
