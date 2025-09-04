## Installation

*Prerequisite: Docker, Docker Compose, Docker network 'proxy-intranet' created*

[Docker Compose](https://docs.craftycontrol.com/pages/getting-started/installation/docker/):

```yaml
services:
  crafty:
    container_name: crafty_container
    image: registry.gitlab.com/crafty-controller/crafty-4:latest
    restart: unless-stopped
    environment:
      - TZ=Europe/Ljubljana
    ports:
      #- 8443:8443 # HTTPS
      #- 8123:8123 # DYNMAP
      #- 8124:8124 # DYNMAP
      - 19132:19132/udp # BEDROCK
      - 25500-25600:25500-25600 # MC SERV PORT RANGE
    volumes:
      - /srv/crafty/backups:/crafty/backups
      - /srv/crafty/logs:/crafty/logs
      - /srv/crafty/servers:/crafty/servers
      - /srv/crafty/config:/crafty/app/config
      - /srv/crafty/import:/crafty/import
    networks:
      - proxy-intranet
networks:
  proxy-intranet:
    external: true
```



## Permission Setting

Replace *SERVER_ID* with actual folder name.

*Ownership:*

```
sudo chown 1000:1000 /srv/crafty/servers/SERVER_ID -R
```

*Permissions:*

```
sudo chmod 2775 /srv/crafty/servers/SERVER_ID -R
```



## Usage

IP: `http://[HOST_ADDRESS]:8443`



## Resources

- [Home](https://craftycontrol.com/#home)
- [Installation](https://docs.craftycontrol.com/pages/getting-started/installation/linux/)
- [Updating](https://docs.craftycontrol.com/pages/getting-started/installation/linux/#updating-crafty)
- [Docs](https://docs.craftycontrol.com/pages/getting-started/installation/linux/)
- [EASY Budget Minecraft Servers With Crafty](https://www.youtube.com/watch?v=bAGTwBURBXc)