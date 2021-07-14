#!/bin/bash
#this will install vscode and all my favorite plugins and themes

# install vscode through apt
sudo apt install code


# use the vscode cli to install plugin/theme
code --install-extension abusaidm.html-snippets
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension ecmel.vscode-html-css
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-complete-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension HookyQR.beautify
code --install-extension ionutvmi.path-autocomplete
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension octref.vetur
code --install-extension PKief.material-icon-theme
code --install-extension ritwickdey.LiveServer
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wayou.vscode-todo-highlight
code --install-extension yzhang.markdown-all-in-one

# theme
code --install-extension dracula-theme.theme-dracula