#!bin/bash
# set the konsole to the dracula theme
#

# download the theme file
wget -P /tmp https://raw.githubusercontent.com/dracula/konsole/master/Dracula.colorscheme

# move theme to folder
mv /tmp/Dracula.colorscheme ~/.local/share/konsole

# TODO: need to figure out how to set the theme in the profile from the cli
# set dracula as main theme

# theme will start next time konsole runs