## Installation

Docker compose:

```yaml
services:
  navidrome:
    image: deluan/navidrome:latest
    user: 1000:1000 # should be owner of volumes (owner of /srv/music/ in my case)
    ports:
      - 4533:4533
    restart: unless-stopped
    environment:
      # Optional: put your config options customization here. Examples:
      # ND_LOGLEVEL: debug
      ND_ENABLETRANSCODINGCONFIG: false
      ND_LASTFM_APIKEY: ${LASTFM_KEY}
      ND_LASTFM_SECRET: ${LASTFM_SECRET}
    volumes:
      - /opt/stacks/navidrome/data:/data
      - /srv/music/primary:/music:ro
      - /srv/music/quarantine:/quarantine:ro
networks: {}
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