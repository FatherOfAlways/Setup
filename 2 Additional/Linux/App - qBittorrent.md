## Updating

1. Get the latest executable on the [releases page](https://github.com/userdocs/qbittorrent-nox-static/releases) and replace the URL below:

```
wget "https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-xxxx/x86_64-qbittorrent-nox" -O qbittorrent-nox
```

2. Stop `qbittorrent-nox`:

```
sudo systemctl stop qbittorrent-nox.service
```

3. Replace the executable in `/usr/bin/` with the one downloaded above - preferably via [`mc`](https://midnight-commander.org/):

```
mc
```

4. Fix the permissions/ownership:

```
sudo chown -R qbittorrent-nox:qbittorrent-nox /usr/bin/qbittorrent-nox
sudo chmod -R 775 /usr/bin/qbittorrent-nox
```

5. Start `qbittorrent-nox`:

```
sudo systemctl start qbittorrent-nox.service
```



## Troubleshooting

### Permission/Ownership Issues

Change download folder **Permissions**:

```
sudo chmod -R 775 /PATH/TO/FOLDER
```

Change download folder **Ownership**:

```
sudo chown -R qbittorrent-nox:qbittorrent-nox /PATH/TO/FOLDER
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



## Dark Mode

The built-in dark mode broke on me for some reason so here's an alternative: [Dracula Theme](https://draculatheme.com/qbittorrent) / [GitHub](https://github.com/dracula/qbittorrent/blob/master/INSTALL.md)



## Resources

**Installation:**

- [How to Install qBittorrent on Ubuntu 24.04](https://linuxcapable.com/how-to-install-qbittorrent-on-ubuntu-linux/)
- [How to Install qBittorrent-NoX](https://saputra.org/threads/how-to-install-qbittorrent-nox-a-headless-and-web-ui-torrent-client.1099/) (useful troubleshooting in comments)

**Updating:**

- [Upgrade instructions](https://forum.qbittorrent.org/viewtopic.php?t=10368)
- [qbittorrent-nox-static Repo](https://github.com/userdocs/qbittorrent-nox-static) (latest versions)


**Troubleshooting:**

- [Explicitly create user with home dir](https://askubuntu.com/questions/374870/home-directory-not-being-created)
- [Removing user accounts](https://askubuntu.com/questions/1013601/removing-user-accounts)
- ["Invalid Username or Password"](https://www.reddit.com/r/docker/comments/1812wyf/has_anyone_else_had_the_qbittorrent_invalid/)
- [Where are .torrent files stored?](https://www.reddit.com/r/qBittorrent/comments/enj9w3/where_are_torrent_files_stored/)

