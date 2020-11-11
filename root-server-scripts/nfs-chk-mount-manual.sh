#!/bin/bash
###############################################
## check nfs mnt manual  v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
###############################################

#restart every x seconds
TIME=30

#start loop starting 
while true; do sh /path/to/script/pingmnt.sh
echo ""
echo "Press Ctrl-C to cancel"
echo ""
sleep $TIME
done
exit
