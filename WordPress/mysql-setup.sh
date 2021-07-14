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

# Set up database
DB_PASS="$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)"
mysql -u root --execute="CREATE DATABASE wp_$INSTALL;"
mysql -u root --execute="CREATE USER '$INSTALL'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -u root --execute="GRANT ALL ON $INSTALL.* TO '$INSTALL'@'localhost';FLUSH PRIVILEGES;"

echo "DB:          wp_$INSTALL"
echo "DB USERNAME: $INSTALL"
echo "DB PASSWORD: $DB_PASS"