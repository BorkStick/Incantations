!#/bin/bash

#install script for a fresh ubuntu desktop install

#things to install

#chrome
#atom.io
#gparted
clear
echo ""
echo "=================================================================="
echo " Welcome to the BorkSlash INITIAL SETUP SCRIPT FOR DESKTOP LINUX! "
echo "=================================================================="
echo ""

#tewaked for ubuntu 18.04



echo ""
echo "===================="
echo " GOTTA ADD THEM REPOS! "
echo "===================="
echo ""

#----------
# add repos
#----------
#obs
sudo add-apt-repository ppa:obsproject/obs-studio

#ATOM.IO
sudo add-apt-repository ppa:webupd8team/atom

#chrome repository
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

#enpass
echo "deb http://repo.sinew.in/ stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -





#clear
echo ""
echo "============================================="
echo " UPDATTTTEEEEEEEEEE UPGRADDDDDDDDDEEEEEEEEE! "
echo "============================================="
echo ""


#check for upgrades then check for upgrades
sudo apt update -y && sudo apt upgrade -y





#clear
echo ""
echo "========================="
echo " INSATALL THEM PROGRAMS! "
echo "========================="
echo ""

# look at this fancy shit. programing fuck yeah
# install all the apps
AppList="autokey-gtk vim i3 rofi htop tmux ffmpeg gdebi build-essential ffmpeg filezilla git curl hexchat gparted cmatrix exfat-fuse exfat-utils dconf-cli software-properties-common openssh-server atom ranger obs-studio google-chrome-stable enpass vlc virtualbox gnome-tweaks vagrant"
sudo apt install -y $AppList

# install atom addons
AtomList=" atom-beautify file-icons pigments highlight-selected linter linter-markdown markdown-writer markdown-scroll-sync platformio-ide-terminal"
apm install -y $AtomList



# todo need to make this not download to the scrips folder
# wget to /tmp then dpkg it from there
#GITKRACKEN
wget -P /tmp https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i /tmp/gitkraken-amd64.deb

# install youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# coool snap package
# install discord
sudo snap install discord



# todo
# install gnome extentions



#clear
echo ""
echo "===================="
echo " SCRIPT TIME! "
echo "===================="
echo ""



#dracula theme for gnome terminal
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
./gnome-terminal-colors-dracula/install.sh





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
# todo do get the dotfiles repo setup and working
git clone http://borkslash.com:8087/BorkStick/dotfiles.git ~/dotfiles
# need to symlink them


#tmux
git clone https://github.com/4ciiDic/tmux.conf.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf

# todo atom dotfiles
# ~/.atom

# todo
# set theme to adwaita-dark

# set desktop wallpaper
mkdir ~/Pictures/Wallpapers
wget -P ~/Pictures/Wallpapers https://release.gitkraken.com/linux/gitkraken-amd64.deb
gsettings set org.gnome.desktop.background picture-uri file:////home/aciidic/Pictures/Wallpapers/wallpaper.jpg


# todo figure out how to add in my hotkeys
# hotkeys

# todo copy over autokeys

#kodi

#----------
# update system settings
#----------

#----------
# requires clicks
#----------
sudo apt-get install -y ubuntu-restricted-extras





#clear
echo ""
echo "===================="
echo " Jobs Finished! "
echo "===================="
echo ""
