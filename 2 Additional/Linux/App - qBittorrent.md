## Installation

Docker compose:

```yaml
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Ljubljana
      - WEBUI_PORT=8800
      - TORRENTING_PORT=7999
    volumes:
      - ./config:/config # REQUIRED
      - ./themes:/themes # OPTIONAL
      - /mnt/titan/qbit:/qbit # SEMI-REQUIRED: downloads
    ports:
      #- 8800:8800 # WebUI Port
      - 7999:7999 # Listening Port
      - 7999:7999/udp # Listening Port
    restart: unless-stopped
    networks:
      - proxy-intranet
networks:
  proxy-intranet:
    external: true
```

## Troubleshooting

### Permission/Ownership Issues

Change download folder **Permissions**:

```
sudo chmod -R 775 /PATH/TO/FOLDER
```

Change download folder **Ownership**:

```
sudo chown -R 1000:1000 /PATH/TO/FOLDER
```

### qBittorrent service

- Restart:

	```
	sudo systemctl restart qbittorrent-nox.service
	```

- Stop:

	```
	sudo systemctl stop qbittorrent-nox.service
	```



## Themes

### Links

- [cjratliff](https://github.com/Carve/qbittorrent-webui-cjratliff.com)
- [Dracula](https://github.com/dracula/qbittorrent)

**Tip:** If something looks off after the theme is applied, try deleting the cache.

### Troubleshooting

**["Unacceptable file type, only regular file is allowed"](https://www.reddit.com/r/qBittorrent/comments/ky01n4/web_ui_stuck_on_unacceptable_file_type_only/)**


1. Manually edit the setting in my qBittorrent.conf file:

	```
	WebUI\AlternativeUIEnabled=false
	```

2. Restart qBittorrent.



## Resources

**Installation:**

- [Let's Install qBittorrent using Docker Compose](https://www.youtube.com/watch?v=T1CaemsfkkU)
- [Docker Hub: linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)


**Troubleshooting:**

- ["Invalid Username or Password"](https://www.reddit.com/r/docker/comments/1812wyf/has_anyone_else_had_the_qbittorrent_invalid/)
- [Where are .torrent files stored?](https://www.reddit.com/r/qBittorrent/comments/enj9w3/where_are_torrent_files_stored/)


**Obsolete:**

- [Explicitly create user with home dir](https://askubuntu.com/questions/374870/home-directory-not-being-created)
- [Removing user accounts](https://askubuntu.com/questions/1013601/removing-user-accounts)
- [How to Install qBittorrent on Ubuntu 24.04](https://linuxcapable.com/how-to-install-qbittorrent-on-ubuntu-linux/)
- [How to Install qBittorrent-NoX](https://saputra.org/threads/how-to-install-qbittorrent-nox-a-headless-and-web-ui-torrent-client.1099/) (useful troubleshooting in comments)
- [Upgrade instructions](https://forum.qbittorrent.org/viewtopic.php?t=10368)
- [qbittorrent-nox-static Repo](https://github.com/userdocs/qbittorrent-nox-static) (latest versions)