#!/bin/bash
###############################################
## certbot update Script v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
###############################################
# renew Certbot Certs
certbot renew
# remove old Certs
rm -rf /etc/pve/nodes/NODE/pveproxy-ssl.pem                                         ## change NODE
rm -rf /etc/pve/nodes/NODE/pveproxy-ssl.key                                         ## change NODE
# copy to PVE Proxy Cert Folder
cp /etc/letsencrypt/live/DOMAIN/fullchain.pem /etc/pve/nodes/NODE/pveproxy-ssl.pem  ## change DOMAIN and NODE
cp /etc/letsencrypt/live/DOMAIN/privkey.pem /etc/pve/nodes/NODE/pveproxy-ssl.key    ## change DOMAIN and NODE
# restart PVE Proxy
pveproxy restart
