#!/bin/bash
# Bash Menu Script Example

# Intro
clear
echo ""
echo "=================================================================="
echo " Welcome to the BorkSlash INITIAL SETUP SCRIPT FOR DESKTOP LINUX! "
echo "=================================================================="
echo ""

sleep 1

clear


# Chooose what to install
# basic, min, full, manual, quit
#
#
PS3='Please enter your choice: '
options=("Basic" "Min" "Full" "Manual" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Basic")
            echo "you chose $opt"
            upup();
            ;;
        "Min")
            echo "you chose $opt"
            ;;
        "Full")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Manual")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


# basic
# 
#
basic() {

}


# min
#
# vim tmux htop git
min() {

}


# full
#
#
full(){

}


# manual
#
#
manual() {
    
}


# update and upgrade 
upup() {
    sudo apt update -y && sudo apt upgrade -y
}