podman run -d \
 -p 8096:8096/tcp \
 -p 1900:1900/udp \
 -p 7359:7359/udp \
 --name jellyfin \
 --net=host \
 --volume /home/jellyfin/config:/config \
 --volume /home/jellyfin/cache:/cache \
 --mount type=bind,source=/home/jellyfin/media/movies,target=/media/movies \
 --mount type=bind,source=/home/jellyfin/media/tv,target=/media/tv \
 --restart=unless-stopped \
 --replace \
 docker.io/jellyfin/jellyfin

podman run -d \
 -p 443:443/tcp \
 -p 80:80/tcp \
 -e CF_API_TOKEN=$CF_API_TOKEN \
 --name caddy \
 --replace \
 ghcr.io/da1rren/caddy:main

mkdir /home/jellyfin
mkdir /home/jellyfin/cache
mkdir /home/jellyfin/config
mkdir /home/jellyfin/media
mkdir /home/jellyfin/media/movies
mkdir /home/jellyfin/media/tv
