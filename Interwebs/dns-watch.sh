#!/bin/bash

width=43

DOMAIN=$1
if [ -z $1 ]
then
echo ""
printf "Enter the DOMAIN name you want to check and press [ENTER]"
printf -- '\n';

read DOMAIN
fi

# curls ipinfo and to a var
curl https://dns.google.com/resolve?name=$DOMAIN&type=A



printf -- '\n';
printf -- '\n';
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
printf -- '\n';


printf -- '\n';
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =


printf -- '\n';
exit 0