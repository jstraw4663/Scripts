#!/bin/bash
now=$(date)
echo "$now" 
echo "Starting Sync"
acd_cli sync
echo "Beginning Upload"
acd_cli ul -x 2 -r 5 /home/plex/.local-sorted/* /
echo "Upload Complete"
echo "Beginning Sync"
acd_cli sync
echo "Deleting Files older than 14 Days"
find /home/plex/.local-sorted/ -type f -mtime +14 -exec rm -rf {} \;
end=$(date)
echo "Complete"
echo "$end"
