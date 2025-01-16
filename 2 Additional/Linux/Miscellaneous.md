## [nVidia Drivers](https://ubuntu.com/server/docs/nvidia-drivers-installation#p-97843-installing-the-drivers-on-servers-andor-for-computing-purposes)

Server installation:

```
sudo ubuntu-drivers --gpgpu install
```



## [nginx](https://nginx.org/en/)

Available configs location: `/etc/nginx/sites-available/`  
Enabled configs location: `/etc/nginx/sites-enabled/`

Main config is first created in `sites-available` then symlinked to `sites-enabled`:

```
sudo ln -s /etc/nginx/sites-available/CONFIG.conf /etc/nginx/sites-enabled/CONFIG.conf
```

Restart after config change:

```
sudo systemctl restart nginx
```



## [rsync](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories)

Common command:

```
sudo rsync -ah --progress /PATH/TO/SOURCE/ /PATH/TO/DESTINATION/
```



## Tips

- [How to unzip a zip file from the Terminal](https://askubuntu.com/questions/86849/how-to-unzip-a-zip-file-from-the-terminal)



## Resources

- [Awesome Sysadmin](https://github.com/awesome-foss/awesome-sysadmin)