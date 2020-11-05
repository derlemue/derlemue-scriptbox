#!/bin/bash
###############################################
## check nfs mount       v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
###############################################

#setup environment variables
HOST=lemuenet.derlemue.com
PORT=2049
PNAME=nfs
MNTPNT=/mnt/lemuenet
NFSSHARE=/volume1/svr-bak

clear
echo "checking if port $PORT ($PNAME) is available at host $HOST"
echo "initialise port scan on port $PORT"
if nc -z $HOST $PORT 2>/dev/null; then
    echo "$HOST status: ✓ (online)"
    echo "connection test succesfull  ✓"
    echo "initalising mount check.."
    if grep -qs $MNTPNT /proc/mounts; then
        echo "mountpoint $MNTPNT is mounted: ✓"
        echo "script finished  ✓"
        sleep 5
    else
        echo "mountpoint $MNTPN is not mounted: ✗"
        echo "Trying to fix.."
        echo "initalising remount.."
        echo "umounting existing NFS mounts.."
        umount -f $MNTPNT
        echo "NFS mounts down ✓"
        echo "cleanup mount point.."
        rm -rf $MNTPNT/*
        echo "cleanup successfull ✓"
        echo "remounting NFS mount.."
        mount -t nfs $HOST:$NFSSHARE $MNTPNT
        sleep 1
        echo "script finished  ✓"
        sleep 5
    fi
else
    echo "$HOST status: ✗ (offline)"
    if grep -qs $MNTPNT /proc/mounts; then
        echo "mountpoint $MNTPNT is not mounted ✗"
        echo "Trying to fix.."
        echo "umounting existing NFS mounts.."
        umount -f $MNTPNT
        echo "NFS mounts down.. ✓"
        echo "cleanup mount point.."
        rm -rf $MNTPNT/*
        echo "cleanup successfull ✓"
        echo "remounting NFS mount.."
        mount -t nfs $HOST:$NFSSHARE $MNTPNT
        sleep 1
        echo "script finished  ✓"
        sleep 5
    else
        echo "mountpoint $MNTPNT is not mounted: ✗"
        echo "Trying to fix.."
        echo "initalising remount.."
        echo "cleanup mount point.."
        rm -rf $MNTPNT/*
        echo "cleanup successfull ✓"
        echo "remounting NFS mount.."
        mount -t nfs $HOST:$NFSSHARE $MNTPNT
        sleep 1
        echo "script finished  ✓"
        sleep 5
   fi
fi
