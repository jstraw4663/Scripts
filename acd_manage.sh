. config
echo "(===== Checks =====)"
if [[ -d "/home/plex/acd-sorted/TvShows" ]];
then
echo "Properly Mounted";
else
echo "Crashed";
echo "(===== Unmount =====)"
echo "Unmount EncFS ACD"
fusermount -z -u /home/plex/.acd-sorted

echo "Unmount ACD"
fusermount -z -u /home/plex/acd-sorted

sleep 2

echo "(===== Mount ACD =====)"
echo "--> Clear Cache"
# possible error here: when the db is corrupt cc fails
acd_cli cc
echo "--> Sync"
acd_cli sync
echo "--> Mount"
acd_cli mount /home/plex/.acd-sorted/

echo "(===== Mount EncFS =====)"
echo '$encfs' | ENCFS6_CONFIG='/path/to/encfs.xml' encfs -S /home/plex/.acd-sorted /home/plex/acd-sorted

fi