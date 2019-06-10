#!/bin/bash
# Install zabbix server
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan


export DEBIAN_FRONTEND=noninteractive



# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

# Install AMP
## Install Apache2
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt-get install -y apache2

## Install PHP
echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo apt-get install -y php libapache2-mod-php php-mysql

## Install mysql
echo -e "$Cyan \n Installing MySQL $Color_Off"
sudo apt-get install -y mysql-server 

## Install Phpmyadmin
echo -e "$Cyan \n Installing phpMyAdmin $Color_Off"
sudo apt-get install -y phpmyadmin 

## Verify
echo -e "$Cyan \n Verifying installs$Color_Off"
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql mysql-server phpmyadmin

# TWEAKS and Settings
## Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

## Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "$Cyan \n Enabling Modules $Color_Off"
sudo a2enmod rewrite
sudo php5enmod mcrypt

## Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo service apache2 restart





