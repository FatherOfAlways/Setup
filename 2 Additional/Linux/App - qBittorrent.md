## Resources

**Installation:**

- [How to Install qBittorrent on Ubuntu 24.04](https://linuxcapable.com/how-to-install-qbittorrent-on-ubuntu-linux/)
- [How to Install qBittorrent-NoX](https://saputra.org/threads/how-to-install-qbittorrent-nox-a-headless-and-web-ui-torrent-client.1099/) (useful troubleshooting in comments)

**Upgrading:**

- [Upgrade instructions](https://forum.qbittorrent.org/viewtopic.php?t=10368)
- [qbittorrent-nox-static Repo](https://github.com/userdocs/qbittorrent-nox-static) (latest versions)


**Troubleshooting:**

- [Explicitly create user with home dir](https://askubuntu.com/questions/374870/home-directory-not-being-created)
- [Removing user accounts](https://askubuntu.com/questions/1013601/removing-user-accounts)
- ["Invalid Username or Password"](https://www.reddit.com/r/docker/comments/1812wyf/has_anyone_else_had_the_qbittorrent_invalid/)
- [Where are .torrent files stored?](https://www.reddit.com/r/qBittorrent/comments/enj9w3/where_are_torrent_files_stored/)


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

Restart qBittorrent service:

```
sudo systemctl restart qbittorrent-nox.service
```