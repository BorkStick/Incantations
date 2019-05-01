#!/bin/bash 

#get the current date
# m-d-y  -  time 
BACKUPTIME=`date +%m-%d-%Y-%H:%M:%S` 

#create a backup file using the current date in it's name
DESTINATION=/home/aciidic/BACKUPS/$BACKUPTIME-backup.tar.gz 

#the folder that contains the files that we want to backup
SOURCEFOLDER=/home/aciidic/Pictures/

cd $SOURCEFOLDER

#create the backup
tar -cPzf $DESTINATION $SOURCEFOLDER 