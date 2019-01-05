#!/bin/bash
#gnome script that will download and set the wallpaper

# set desktop wallpaper
WallURL="https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-72079.png"

mkdir ~/Pictures/Wallpapers
wget -P ~/Pictures/Wallpapers $WallURL
gsettings set org.gnome.desktop.background picture-uri file:////home/aciidic/Pictures/Wallpapers/*
