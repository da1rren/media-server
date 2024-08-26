# Home Media Server Setup

## Setup

### Install podman, just and tailscale
```
curl -fsSL https://tailscale.com/install.sh | sh
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo apt-get -y install just
sudo ufw allow 6881/tcp
sudo ufw allow 6881/udp
```

### Create host directory structure
```
mkdir -p /home/jellyfin/cache
mkdir -p /home/jellyfin/config
mkdir -p /home/jellyfin/media/movies
mkdir -p /home/jellyfin/media/tv
```

### Install netdata
Generate in web ui for auto deploy

### Create cf secret

Add the token with `zone.zone:read` & `zone.dns.edit` then create an env file from the template

### Start all the pods
`just build`

### Install a github agent
Then it will auto update when we push new caddy builds.