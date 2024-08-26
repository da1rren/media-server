FROM docker.io/caddy:2.8.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/WeidiDeng/caddy-cloudflare-ip

FROM docker.io/caddy:2.8.4

COPY caddyfile /etc/caddy/Caddyfile
COPY --from=builder /usr/bin/caddy /usr/bin/caddy