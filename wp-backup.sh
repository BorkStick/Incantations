#!/bin/bash

TODAY=`date '+%Y%m%d'`
TEMP_DIR=/home/nraboy/backups/temp

BACKUP_NAME="blog"
DB_NAME="DATABASE_NAME_HERE"
DB_USER="DATABASE_USERNAME_HERE"
DB_PASS="DATABASE_PASSWORD_HERE"
SITE_PATH=/var/www

echo "Starting Backup..."

mkdir $TEMP_DIR

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $TEMP_DIR/database.sql

tar --exclude="updraft" -zcf $TEMP_DIR/files.tar.gz $SITE_PATH

tar -zcf $BACKUP_NAME-$TODAY.tar.gz -C $TEMP_DIR .

rm -Rf $TEMP_DIR

echo "Backup Complete [$(du -sh $BACKUP_NAME-$TODAY.tar.gz | awk '{print $1}')]"