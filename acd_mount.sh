#!/bin/sh

echo 'Cantelope4' | ENCFS6_CONFIG='/home/plex/encfs.xml' encfs -S /home/plex/.local$
echo 'Cantelope4' | ENCFS6_CONFIG='/home/plex/encfs.xml' encfs -S /home/plex/.acd-s$
acd_cli mount /home/plex/.acd-sorted/
unionfs-fuse -o cow /home/plex/local-sorted=RW:/home/plex/acd-sorted=RO /home/p$
mount -t tmpfs -o size=8G tmpfs /var/lib/plexmediaserver/Library/Transcoding
