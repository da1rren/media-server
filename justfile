build:
	docker compose up --pull

clean: 
	docker compose down

rebuild: clean build

exec:
	docker exec -it media-caddy /bin/sh

logs:
	docker logs -f media-caddy