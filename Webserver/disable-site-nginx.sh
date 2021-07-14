#!/bin/bash

read -p "Do you want to disable the $1 install [y/n]" -n 1 -r
echo


if [[ $REPLY =~ ^[Yy]$ ]]; then

    echo -e "\nDisabling Install: " $1
#sudo rm /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
#sudo systemctl reload nginx
echo "$1 is now disabled"

else
echo -e "\nWe aint doing that to " $1

fi