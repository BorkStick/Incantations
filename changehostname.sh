#!/bin/bash
#
# channge the hostname for ubuntu 18.04
#



#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#Display existing hostname
echo "The current hostname be $hostn"

#Ask for new hostname $newhost
echo "What you want the new hostname to be: "
read newhost

#change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

#display new hostname
echo "Your new hostname is $newhost"

# change cloudconfig