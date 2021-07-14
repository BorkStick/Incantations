#!/bin/bash
# Install zabbix server
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-zabbix-to-securely-monitor-remote-servers-on-ubuntu-18-04

export DEBIAN_FRONTEND=noninteractive

# Prerequisites Install LAMP
sudo apt install apache2
sudo apt install mysql-server
sudo apt install php libapache2-mod-php php-mysql


# Installing the Zabbix Server

wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
sudo dpkg -i zabbix-release_4.2-1+bionic_all.deb


sudo apt update

sudo apt install zabbix-server-mysql zabbix-frontend-php
sudo apt install zabbix-agent

# Configuring the MySQL Database for Zabbix
# Set up database
DB_PASS="$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)"
mysql -u root --execute="create database zabbix character set utf8 collate utf8_bin;"
mysql -u root --execute="grant all privileges on zabbix.* to zabbix@localhost identified by '$DB_PASS';"
mysql -u root --execute="flush privileges;"




# set up the schema and import the data into the zabbix database
zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix






# END
echo "#####################################"


echo "DB:          zabbix"
echo "DB USERNAME: zabbix"
echo "DB PASSWORD: $DB_PASS"


echo "#####################################"
echo " "
