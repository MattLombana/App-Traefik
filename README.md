# App-Traefik

## Running the Containers

1. Run `./Config/gen_certs.sh` to generate the SSL certificates (alternatively,
   add custom certs to the private folder)
3. Update the following label in [docker-compose.yml](./Docker/docker-compose.yml) to point to the correct hostname
    * ``"traefik.http.routers.api.rule=Host(`localhost`)"``
4. Run `docker-compose -f ./Docker/docker-compose.yml up -d`
5. Edit any other docker containers, and add the appropriate labels:
```
    labels:
      # Traefik Labels
      - "traefik.enable=true"
      # HTTPS Labels
      - "traefik.http.routers.whoami.rule=Host(`localhost`)" # Domain Name
      - "traefik.http.routers.whoami.entrypoints=web-secure"
      - "traefik.http.routers.whoami.middlewares=default-headers@file"
      - "traefik.http.routers.whoami.service=whoami"
      - "traefik.http.routers.whoami.tls=true"
      - "traefik.http.services.whoami.loadbalancer.server.port=80" # Proxied Port
```

## First Time Setup

1. Visit <https://your-ip>
