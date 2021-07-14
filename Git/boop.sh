#!/bin/bash
# script to add commit and push git repo
COMMIT_MSG=$1


git add .
git commit -m "$COMMIT_MSG"
git push