# Home Media Server Setup

## Setup

### Configure docker logs
Create/add (If using snap) `/var/snap/docker/current/config/daemon.json` with the contents:

```
{
  "log-driver": "journald"
}
```

### Install docker, just and tailscale
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

### Mount the drive with fstab

The UUID can be obtained with `sudo blkid`

For example:
`UUID=3e96d644-17ee-4637-a1f3-7612312f5d3b       /home/jellyfin/media/shows      ext4    noatime,x-systemd.automount,x-systemd.device-timeout=10,x-systemd.idle-timeout=1min 0 2`

### Start all the pods
`just build`

### Install a github agent
Then it will auto update when we push new caddy builds.