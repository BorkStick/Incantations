#!/bin/sh
# This script will install a new BookStack instance on a fresh Ubuntu 18.04 server.
# This script is experimental and does not ensure any security.

# Fetch domain to use from first provided parameter,
# Otherwise request the user to input their domain
INSTALL=$1
if [ -z $1 ]
then
echo ""
printf "Enter the install name you want to use and press [ENTER]\nExamples: beaker or kermit\n"
read INSTALL
fi

# remove up database
DB_PASS="$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)"
mysql -u root -pRp0U0V5Ubvkc --execute="DROP DATABASE wp_$INSTALL;"
mysql -u root -pRp0U0V5Ubvkc --execute="REVOKE ALL PRIVILEGES, GRANT OPTION FROM '$INSTALL'@'localhost';"
mysql -u root -pRp0U0V5Ubvkc --execute="DROP USER '$INSTALL'@'localhost';"



sudo rm /etc/nginx/sites-available/$INSTALL
sudo rm /etc/nginx/sites-enabled/$INSTALL
sudo systemctl reload nginx


sudo rm /etc/apache2/sites-available/$INSTALL.conf 
sudo rm /etc/apache2/sites-enabled/$INSTALL.conf

sudo systemctl restart apache2

