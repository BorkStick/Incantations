!#/bin/bash

#install script for a fresh ubuntu install

#things to install

#chrome
#atom.io
#gparted

#----------
# add repos
#----------
#obs
sudo add-apt-repository ppa:obsproject/obs-studio

#ATOM.IO
sudo add-apt-repository ppa:webupd8team/atom



#----------
# basic update
#----------
#check for upgrades then check for upgrades
sudo apt update -y && sudo apt upgrade -y

#----------
# install apps
#----------

# install all the apps
AppList="vim htop tmux ffmpeg gdebi build-essential ffmpeg gdebi build-essential filezilla git curl gparted cmatrix exfat-fuse exfat-utils dconf-cli software-properties-common openssh-server atom ranger obs-studio "
sudo apt install -y $AppList


#GITKRACKEN
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb


#----------
# scripts
#----------

#----------
# dotfiles
#----------
#tmux
git clone https://github.com/4ciiDic/tmux.conf.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf

#kodi

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
