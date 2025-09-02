## Installation

*Prerequisite: Docker, Docker Compose, Docker network 'proxy-intranet' created*

Docker compose:

```yaml
services:
  navidrome:
    image: deluan/navidrome:latest
    user: 1000:1000 # should be owner of volumes ('fatherofalways' in my case; owner of /srv/music/)
    #ports:
    #  - 4533:4533
    restart: unless-stopped
    environment:
      # Optional: put your config options customization here. Examples:
      # ND_LOGLEVEL: debug
      ND_REVERSEPROXYWHITELIST: 172.24.0.3/32 # NPM IP in "proxy-intranet" network
      ND_ENABLETRANSCODINGCONFIG: false
      ND_LASTFM_APIKEY: 972a476a009219800eb2d0764d3e5f7f # ${LASTFM_KEY}
      ND_LASTFM_SECRET: baf23ba0099873fa09c326e686c117a2 # ${LASTFM_SECRET}
    volumes:
      - /opt/stacks/navidrome/data:/data
      - /srv/music/primary:/music:ro
      - /srv/music/quarantine:/quarantine:ro
    networks:
      - proxy-intranet
networks:
  proxy-intranet:
    external: true
```



## Usage

IP: `http://[HOST_ADDRESS]:4533`



## Music Folder Permissions & Ownership

Ownership:

```
sudo chown -R USERNAME:USERNAME /srv/music
```

Folder permissions:

```
sudo chmod -R u=rwX,g=rwX,o= /srv/music
```

File permissions:

```
sudo chmod g+s /srv/music
```



## Resources

- [Documentation](https://www.navidrome.org/docs/installation/linux/)