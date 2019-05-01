#!/bin/bash 

#get the current date
BACKUPTIME=`date +%b-%d-%y` 

#create a backup file using the current date in it's name
DESTINATION=/home/aciidic/BACKUPS/backup-$BACKUPTIME.tar.gz 

#the folder that contains the files that we want to backup
SOURCEFOLDER=/home/aciidic/Pictures/ 

#create the backup
tar -cpzf $DESTINATION $SOURCEFOLDER #create the backup