#!/bin/bash

for app in "$@"
do
  cp -r $app/. ~/
done
