#!/bin/bash
# Bash Menu Script Example


# utokey-gtk vim i3 rofi htop tmux ffmpeg gdebi build-essential ffmpeg filezilla git curl hexchat gparted cmatrix exfat-fuse exfat-utils dconf-cli software-properties-common openssh-server atom ranger obs-studio google-chrome-stable enpass vlc virtualbox gnome-tweaks vagrant libcanberra-gtk0 libcanberra-gtk-module libgnome-keyring-common libgnome-keyring-dev
MinAppList="vim git"
BasicAppList=""
FullAppList=""
ManualAppList=""

# Functions

# basic
# 
#
basic() {
    #clear
    echo "Starting with the $opt""s"
    sudo apt install -y $BasicAppList
    dotfiles
    
}


# min
#
# vim tmux htop git
min() {
    #clear
    echo "Starting the $opt install"
    dotfiles
    #sudo apt install -y $MinAppList
    
}


# full
#
#
full(){
    clear
    echo "Starting the $opt install"
    sudo apt install -y $FullAppList
}


# manual
#
#
manual() {
    clear
    echo "Time for the $opt installation"

    sudo apt install -y $ManualAppList

}

dotfiles() {
#clear
echo ""
echo "========================="
echo " DEEZ DEM DOTFILES! "
echo "========================="
echo ""

#----------
# dotfiles
#----------

# I should be able to set this shit up so it pulls my dotfiles from github/gitlab
# TODO: do get the dotfiles repo setup and working
git clone http://lab.borkslash.com/BorkStick/dotfiles.git ~/dotfiles

# need to symlink them
sh ~/dotfiles/bootstrap.sh
}

# update and upgrade 
upup() {
    sudo apt update -y && sudo apt upgrade -y
}

jobDone() {
clear
echo ""
echo "===================="
echo " Jobs Finished! "
echo "===================="
}

# Intro
intro() {
clear
echo ""
echo "=================================================================="
echo " Welcome to the BorkSlash INITIAL SETUP SCRIPT FOR DESKTOP LINUX! "
echo "=================================================================="
echo ""
sleep 1
clear
}

mainMenu() {
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
            basic
            #jobDone
            break
            ;;
        "Min")
            echo "you chose $opt"
            min
            #jobDone
            break
            ;;
        "Full")
            echo "you chose choice $REPLY which is $opt"
            full
            #jobDone
            break
            ;;
        "Manual")
            echo "you chose choice $REPLY which is $opt"
            full
            #jobDone
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}



#
# It starts here
#

intro
mainMenu

