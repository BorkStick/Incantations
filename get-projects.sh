#!/bin/bash
# Bash Menu Script Example





 
upAndRunning() {
echo ""
echo "===================="
echo " Doing the needful  "
echo "===================="    
echo ""
echo ""
GITUSER=BorkStick
GITPASS=$1
if [ -z $1 ]
then
echo ""
printf "Enter the gitlab Password:\n"
read -s GITPASS
fi
cd ~
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/scripts.git
cd ~/Documents
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borknotes.git
mkdir ~/PROJECTS
cd ~/PROJECTS
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/server-stuff.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/anisble-playborks.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/beaker.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkscan.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkdns.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/chillbot.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/pi-led.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkwatch.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkhouse.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkcalc.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkscreen.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/fcc-projects.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/server-dotfiles.git
git clone https://$GITUSER:$GITPASS@lab.borkslash.com/borkstick/borkweather-vue.git
}

#PROJECT LIST
# server-stuff, anisble-playborks, beaker, borkscan, desktop-setup, borkvagrant, borkdns, chillbot, pi-led, borkwatch, borkhouse, borkcalc, borkscreen, fcc-projects, server-dotfiles, borkweather-vue


jobDone() {
#clear
echo ""
echo "===================="
echo " Jobs Finished!     "
echo "===================="
echo ""
echo ""
}

# Intro
intro() {
#clear
echo ""
echo "=================================================================="
echo "               Pulling Your PROJECTS from gitlab                  "
echo "=================================================================="
echo ""
sleep 1
#clear
}


intro
upAndRunning

