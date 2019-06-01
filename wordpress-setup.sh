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
sudo mysql -u root -pRp0U0V5Ubvkc --execute="CREATE DATABASE wp_$INSTALL;"
sudo mysql -u root -pRp0U0V5Ubvkc --execute="CREATE USER '$INSTALL'@'localhost' IDENTIFIED BY '$DB_PASS';"
sudo mysql -u root -pRp0U0V5Ubvkc --execute="GRANT ALL ON wp_$INSTALL.* TO '$INSTALL'@'localhost';FLUSH PRIVILEGES;"

echo "#####################################"


echo "DB:          wp_$INSTALL"
echo "DB USERNAME: $INSTALL"
echo "DB PASSWORD: $DB_PASS"


echo "#####################################"

# Download Wordpress
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/$INSTALL

# Generate Salts
SALTS="$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)"


# .htaccess
sudo cat >/var/www/$INSTALL/.htaccess <<EOL
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
EOL

# Setup wp-config
sudo cat >/var/www/$INSTALL/wp-config.php <<EOL
<?php

# Database Configuration
define( 'DB_NAME', 'wp_${INSTALL}' );
define( 'DB_USER', '${INSTALL}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', '127.0.0.1' );
define( 'DB_HOST_SLAVE', '127.0.0.1' );
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_unicode_ci');
$table_prefix = 'wp_';

# Security Salts
${SALTS}


# Wordpress Things

define( 'FS_METHOD', 'direct' );
define( 'WP_POST_REVISIONS', 3 );


# BorkHost Settings






# That's all, stop editing! Happy blogging. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
EOL



# Set file and folder permissions
sudo chown -R www-data:www-data /var/www/$INSTALL

sudo find /var/www/$INSTALL/ -type d -exec chmod 750 {} \;
sudo find /var/www/$INSTALL/ -type f -exec chmod 640 {} \;




sudo cat >/etc/nginx/sites-available/$INSTALL<<EOL
server {
    listen 80;
    server_name INSTALL.bork.host;
    root /var/www/INSTALL;
    index index.php index.htm index.html;

    location / {
        try_files $uri $uri/ /index.php;
    }

    location ~ \.php$ {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOL

sudo ln -s /etc/nginx/sites-available/$INSTALL /etc/nginx/sites-enabled/
sudo systemctl reload nginx


sudo cat >/etc/apache2/sites-available/$INSTALL.conf <<EOL
<VirtualHost *:8080>
    ServerName ${INSTALL}.bork.host
    DocumentRoot /var/www/${INSTALL}
    <Directory /var/www/${INSTALL}>
        AllowOverride All
    </Directory>
</VirtualHost>

EOL

sudo a2ensite $INSTALL.conf
sudo systemctl restart apache2



echo "#####################################"


echo "DB:          wp_$INSTALL"
echo "DB USERNAME: $INSTALL"
echo "DB PASSWORD: $DB_PASS"
echo "Site URL: http://$INSTALL.bork.host"


echo "#####################################"
