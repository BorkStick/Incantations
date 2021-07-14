#!/bin/bash

width=43

IP=$1
if [ -z $1 ]
then
echo ""
printf "Enter the IP name you want to check and press [ENTER]"
printf -- '\n';

read IP
fi

# curls ipinfo and to a var
var="$(curl ipinfo.io/$IP 2>/dev/null)"
printf -- '\n';
printf -- '\n';
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
printf -- '\n';
printf -- 'IP: ';
# prints ip from var
<<<"$var" awk -F'"' '$2=="ip"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'HOSTNAME: ';
<<<"$var" awk -F'"' '$2=="hostname"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'City: ';
<<<"$var" awk -F'"' '$2=="city"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'Region: ';
<<<"$var" awk -F'"' '$2=="region"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'Country: ';
<<<"$var" awk -F'"' '$2=="country"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'LOC: ';
<<<"$var" awk -F'"' '$2=="loc"{printf("%s, ", $4)}'
printf -- '\n';

printf -- 'ORG: ';
<<<"$var" awk -F'"' '$2=="org"{printf("%s, ", $4)}'
printf -- '\n';

printf -- '\n';
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =


printf -- '\n';
exit 0