#!/bin/bash
# Install orginizr
# https://github.com/causefx/Organizr/wiki/Installation---Linux

sudo apt-get update
sudo apt-get install git

sudo git clone https://github.com/elmerfdz/OrganizrInstaller /opt/OrganizrInstaller
cd /opt/OrganizrInstaller/ubuntu/oui
sudo bash ou_installer.sh