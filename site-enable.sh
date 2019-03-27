#!/bin/bash
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo systemctl reload nginx
echo "$1 is now enabled"