#!/bin/bash

#additional line in crontab (hourly):
#0 * * * * MAILTO="" /opt/lesson2_hw.sh > /opt/lesson2_hw.log 2>&1

REMOTE_USER=root
REMOTE_HOST=myserver
FILENAME=lesson2_$(date +'%F_%H:%M:%S').bak

cd /opt/backup || mkdir /opt/backup && cd /opt/backup

dd if=/dev/urandom of="$FILENAME" bs=3M count=1 status=none && rsync -avz ./$FILENAME $REMOTE_USER@$REMOTE_HOST:/opt/backup/

ssh $REMOTE_USER@$REMOTE_HOST 'find /opt/backup/ -name "*.bak" -mtime +7 -delete'
