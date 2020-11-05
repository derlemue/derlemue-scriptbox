#!/bin/bash
###############################################
## check nfs multi mount v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
###############################################

#setup environment variables
HOST=server.domain.com
PORT=2049
PNAME=nfs
MNTPNT1=/mnt/share1
MNTPNT2=/mnt/share2
MNTPNT3=/mnt/share3
NFSSHARE1=/volume1/path/folder1
NFSSHARE2=/volume1/path/with\ spaces
NFSSHARE3=/volume1/path/withoutspaces

clear
echo "checking if port $PORT ($PNAME) is available at host $HOST"
echo "initialise port scan on port $PORT"
if nc -z $HOST $PORT 2>/dev/null; then
    echo "$HOST status: ✓ (online)"
    echo "connection test succesfull  ✓"
    echo "initalising mount check.."
    if (grep -qs $MNTPNT1 /proc/mounts && grep -qs $MNTPNT2 /proc/mounts && grep -qs $MNTPNT3 /proc/mounts ); then
        echo "mountpoint $MNTPNT1, $MNTPNT2 and $MNTPNT3 are mounted: ✓"
#        echo "starting service.."
#        cd /home/user/service
#        command -option 
        echo "script finished  ✓"
        sleep 5
    else
        echo "mountpoint $MNTPNT1, $MNTPNT2 or $MNTPNT3 is not mounted: ✗"
        echo "Trying to fix.."
#        echo "stopping service.."
#        cd /home/user/service
#        command -option 
        echo "initalising remount.."
        echo "umounting existing NFS mounts.."
        umount -f -l $MNTPNT1
        umount -f -l $MNTPNT2
        umount -f -l $MNTPNT3
        echo "NFS mounts down.. ✓"
#        echo "cleanup mount points.."
#        rm -rf $MNTPNT1/*
#        rm -rf $MNTPNT2/*
#        rm -rf $MNTPNT3/*
#        echo "cleanup successfull ✓"
        echo "remounting NFS mounts.."
        mount -t nfs $HOST:"$NFSSHARE1" $MNTPNT1
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE2" $MNTPNT2
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE3" $MNTPNT3
        sleep 1
        echo "script finished  ✓"
        sleep 5
    fi
else
    echo "$HOST status: ✗ (offline)"
    if (grep -qs $MNTPNT1 /proc/mounts && grep -qs $MNTPNT2 /proc/mounts && grep -qs $MNTPNT3 /proc/mounts ); then
        echo "mountpoint $MNTPNT, $MNTPNT2 or $MNTPNT3 is not mounted: ✗"
        echo "Trying to fix.."
#        echo "stopping service.."
#        cd /home/user/service
#        command -option 
        echo "umounting existing NFS mounts"
        umount -f -l $MNTPNT1
        umount -f -l $MNTPNT2
        umount -f -l $MNTPNT3
        echo "NFS mounts down.. ✓"
 #       echo "cleanup mount points.."
 #       rm -rf $MNTPNT1/*
 #       rm -rf $MNTPNT2/*
 #       rm -rf $MNTPNT3/*
 #       echo "cleanup successfull ✓"
        echo "remounting NFS mounts.."
        mount -t nfs $HOST:"$NFSSHARE1" $MNTPNT1
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE2" $MNTPNT2
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE3" $MNTPNT3
        sleep 1
        echo "script finished  ✓"
        sleep 5
    else
        echo "mountpoint $MNTPNT, $MNTPNT2 or $MNTPNT3 is not mounted: ✗"
        echo "Trying to fix.."
#        echo "stopping service.."
#        cd /home/user/service
#        command -option 
        echo "initalising remount.."
#        echo "cleanup mount points.."
#        rm -rf $MNTPNT1/*
#        rm -rf $MNTPNT2/*
#        rm -rf $MNTPNT3/*
#        echo "cleanup successfull ✓"
        echo "remounting NFS mounts"
        mount -t nfs $HOST:"$NFSSHARE1" $MNTPNT1
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE2" $MNTPNT2
        sleep 1
        mount -t nfs $HOST:"$NFSSHARE3" $MNTPNT3
        sleep 1
        echo "script finished  ✓"
        sleep 5
   fi
fi
