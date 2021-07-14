#!/bin/bash
#
# This script configures WordPress file permissions based on recommendations
# from http://codex.wordpress.org/Hardening_WordPress#File_permissions
#
WP_OWNER=www-data # <-- wordpress owner
WP_GROUP=www-data # <-- wordpress group
WP_ROOT=$1 # <-- wordpress root directory
WS_GROUP=www-data # <-- webserver group
 

# Make sure we're in what looks like a WP directory to avoid big snafus
if [ ! -f $WP_ROOT/wp-config.php ]; then
    echo ""
    echo "--------------------------------------------"
    echo "This doesn't look like a Wordpress directory!"
    echo "Current or chosen directory is " $WP_ROOT
    echo "Maybe change directory, or specify a directory as a parameter to this script and try again?"
exit

fi 

echo "Fixing permissions on $WP_ROOT"
echo "Wordpress owner.group: $WP_OWNER.$WP_GROUP"
echo "Web Server group: $WS_GROUP"

# reset to safe defaults
echo 'reset to safe defaults'
find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \;
find ${WP_ROOT} -type d -exec chmod 755 {} \;
find ${WP_ROOT} -type f -exec chmod 644 {} \;
 
# allow wordpress to manage wp-config.php (but prevent world access)
echo 'allow wordpress to manage wp-config.php (but prevent world access)'
chgrp ${WS_GROUP} ${WP_ROOT}/wp-config.php
chmod 660 ${WP_ROOT}/wp-config.php
 
# allow wordpress to manage .htaccess
echo 'allow wordpress to manage .htaccess'
touch ${WP_ROOT}/.htaccess
chgrp ${WS_GROUP} ${WP_ROOT}/.htaccess
chmod 664 ${WP_ROOT}/.htaccess
 
# allow wordpress to manage wp-content
echo 'allow wordpress to manage wp-content'
find ${WP_ROOT}/wp-content -exec chgrp ${WS_GROUP} {} \;
find ${WP_ROOT}/wp-content -type d -exec chmod 775 {} \;
find ${WP_ROOT}/wp-content -type f -exec chmod 664 {} \;