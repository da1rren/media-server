# Home Media Server Setup

## Setup

### Install podman, just and tailscale
```
curl -fsSL https://tailscale.com/install.sh | sh
sudo apt-get -y install podman
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

### Allow lowers ports to be bound by podman
Add `net.ipv4.ip_unprivileged_port_start=80` to /etc/sysctl.conf then reboot

### Install netdata
Generate in web ui for auto deploy

### Create cf secret

Add the token with `zone.zone:read` & `zone.dns.edit` then run:

`cat secrets.yaml | podman secret create media-secrets`

### Start all the pods
`podman kube play --network bridge pod.yaml`