#!/bin/bash
# install gitlab server
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-gitlab-on-ubuntu-18-04

# Installing the Dependencies
sudo apt update
sudo apt install ca-certificates curl openssh-server postfix


# install gitlab
cd /tmp
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

sudo bash /tmp/script.deb.sh

sudo apt install gitlab-ce

# firewall
sudo ufw allow http
sudo ufw allow https
sudo ufw allow OpenSSH


# Editing the GitLab Configuration File
sudo vim /etc/gitlab/gitlab.rb

# change domain