#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for app in "$@"
do
  for file in $(find $app -type f)
  do
    cp ~/${file#$app/} $file
  done
done

IFS=$SAVEIFS
