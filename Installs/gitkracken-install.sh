#!/bin/bash
# a script that will download and install the latest gitkracken deb

# TODO: need to make this not download to the scrips folder
# wget to /tmp then dpkg it from there
#GITKRACKEN
wget -P /tmp https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i /tmp/gitkraken-amd64.deb
sudo apt install -y libgnome-keyring-common libgnome-keyring-dev
sudo apt -y --fix-broken install
