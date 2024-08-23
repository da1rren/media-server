build: pull
	podman kube play podman.yaml --network bridge --replace

clean: 
	podman kube down podman.yaml

rebuild: pull clean build

pull:
	podman pull ghcr.io/da1rren/caddy:main

exec:
	podman exec -it media-caddy /bin/sh

logs:
	podman logs -f media-caddy