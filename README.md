# ssh-port-forwarding
A docker image for forwarding ports of a remote server to the local client

## Usage with docker-compose
- Setup your `~/.ssh/config`
- Create one service for each remote
- Get inspiration from the following `docker-compose.yml`

```yml
version: '3'

services:
  example-portainer:
    build: .
    container_name: example-portainer
    user: "1000:1000"
    ports:
      - 12100:12100
    volumes:
      - ~/.ssh:/home/sshtnl/.ssh:ro
    environment:
      remoteBinding: "127.0.0.1:9000"
      localBinding: "0.0.0.0:12100"
      remoteName: "example"

  example-traefik:
    build: .
    container_name: example-traefik
    user: "1000:1000"
    ports:
      - 12110:12110
    volumes:
      - ~/.ssh:/home/sshtnl/.ssh:ro
    environment:
      remoteBinding: "127.0.0.1:7080"
      localBinding: "0.0.0.0:12110"
      remoteName: "example"
```

## TODO
- Fix static UID and GID
