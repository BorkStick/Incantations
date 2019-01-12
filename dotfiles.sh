#!/bin/bash
# script that will grab and install my dotfiles

# download dotfiles from borklab
git clone http://lab.borkslash.com/BorkStick/dotfiles.git ~/dotfiles

# run the bootstrap script
./dotfiles/bootstrap