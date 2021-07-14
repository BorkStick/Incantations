#!/bin/bash
#make all the scripts exicutible 

#set the dir to the current working directory
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "current dir is $DIR"
sudo chmod -R +x $DIR/*

echo "Spells in $DIR are now exicutible"