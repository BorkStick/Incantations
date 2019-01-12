#!/bin/bash
# startup script for borkmac that is run at boot, that opens all the essential webpages 
#  google-chrome ""

#Dashboard
google-chrome "http://10.0.0.40/"

# download stuff
google-chrome --new-window "http://10.0.0.55:8080/" #sabnzb
google-chrome "http://10.0.0.56:8989/calendar" #sonarr
google-chrome "http://10.0.0.57:7878/" #radarr

# server stuff
google-chrome --new-window "https://10.0.0.10:8006/" #borknuc
google-chrome "http://10.0.0.50" #borknas
google-chrome "http://10.0.0.20/phpldapadmin/"

# Network
google-chrome --new-window "https://10.0.0.1:52910/" #borknet (router)
google-chrome "https://10.0.0.235:8443" #borkkey (ubuiquiti webui | switch/wifi)

# mmonitoring
google-chrome --new-window "http://10.0.0.70/zabbix" #zabbix
google-chrome "https://10.0.0.1:3000" #ntopng
google-chrome "http://10.0.0.50/netdata/"

