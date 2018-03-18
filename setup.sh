#!/bin/sh

## update and upgrade
sudo apt update -y && sudo apt upgrade -y

## install all the apps
AppList="vim htop tmux  dconf-cli git"
sudo apt install -y $AppList

# deb installs
## install gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb


# Things that need user input

# install atom
## add repo
sudo add-apt-repository ppa:webupd8team/atom
## update and install atom
sudo apt update -y; sudo apt install atom -y
