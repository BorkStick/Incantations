#!/bin/bash
# script to add commit and push git repo

# need to find a way to use string instead of arg
# mabey ask for message and use that
read -p "Commit message here: " -n 1 -r
echo

COMMIT_MSG=$REPLY

#check if message is blank
if [[ $REPLY =~ ^\s*$ ]]; then
echo -e "\nNo commit message" $1


else

git add .
git commit -m "$COMMIT_MSG"
git push

fi

