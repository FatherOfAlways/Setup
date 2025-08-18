## Installation

Docker Compose:

```
services:
  feishin:
    container_name: feishin
    image: ghcr.io/jeffvli/feishin:latest
    environment:
      - SERVER_NAME=SERVER_NAME # Predefined server name
      - SERVER_LOCK=true # When true AND name/type/url are set, only username/password can be toggled
      - SERVER_TYPE=navidrome # 'jellyfin' also works
      - SERVER_URL=http://IP_ADDRESS:PORT
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Ljubljana
    ports:
      - 9180:9180
    restart: unless-stopped
networks: {}
```



## Usage

IP: `http://[HOST_ADDRESS]:9180`



## Resources

- [Documentation](https://github.com/jeffvli/feishin)