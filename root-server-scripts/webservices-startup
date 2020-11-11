#!/bin/bash
###############################################
## webservices startup   v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
############################################### 
### Start Teamspeak Server 
sh /home/ts3/teamspeak3-server_linux_amd64/ts3server_startscript.sh restart
sleep 10 # Waits 10 seconds
### Mount Sinusbot Volumes 
mount /dev/sdc /opt/sinusbot01
sleep 2 # Waits 2 seconds
mount /dev/sdb /opt/sinusbot02
sleep 2 # Waits 2 seconds
### Start Docker Sinusbot 1 
docker restart sinusbot01
sleep 10s # Waits 10 seconds 
### Start Docker Sinusbot 2 
docker restart sinusbot02
sleep 10s # Waits 10 seconds 
### Start Docker Sinusbot 3 
docker restart sinusbot3
sleep 10s # Waits 10 seconds 
### Start Service Phantombot 1 
systemctl start phantombot
sleep 10s # Waits 10 seconds 
### Start Service Phantombot 2 
systemctl start phantombot2
sleep 10s # Waits 10 seconds
