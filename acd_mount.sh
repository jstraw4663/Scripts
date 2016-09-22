#!/bin/sh

echo 'Cantelope4' | ENCFS6_CONFIG='/home/plex/encfs.xml' encfs -S /home/plex/.local-sorted/ /home/plex/local-sorted/
echo 'Cantelope4' | ENCFS6_CONFIG='/home/plex/encfs.xml' encfs -S /home/plex/.acd-sorted /home/plex/acd-sorted
acd_cli mount /home/plex/.acd-sorted/
unionfs-fuse -o cow /home/plex/local-sorted=RW:/home/plex/acd-sorted=RO /home/plex/sorted/
mount -t tmpfs -o size=8G tmpfs /var/lib/plexmediaserver/Library/Transcoding
