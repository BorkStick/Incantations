#!/bin/bash
#make all the scripts exicutible 

#set the dir to the current working directory
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "current dir is $DIR"
sudo chmod +x $DIR/*

echo "Incantations in $DIR are now exicutible"