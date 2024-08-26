cd $(dirname $0)
sudo mount /dev/sdb /home/jellyfin/media/shows
sudo chown -R $(id -u):$(id -g) /home/jellyfin/
