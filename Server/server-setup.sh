!#/bin/bash

#install script for a fresh ubuntu server install

#things to install

#add ssh keys for desktop laptop and borkssh
#disable password auth
#add server to ldap
#install the essentials


#----------
# add repos
#----------



#----------
# basic update
#----------
#check for upgrades then check for upgrades
sudo apt update -y && sudo apt upgrade -y

#----------
# install apps
#----------

# install all the apps
AppList="vim htop tmux ffmpeg build-essential git curl cmatrix dconf-cli software-properties-common openssh-server ranger"
sudo apt install -y $AppList





#----------
# scripts
#----------



#----------
# dotfiles
#----------



#----------
# update system settings
#----------

#----------
# requires clicks
#----------
sudo apt-get install -y ubuntu-restricted-extras

#----------
# prompt for a reboot
#----------
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
