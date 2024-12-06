## Installation

In case it's not already included in distro:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install samba samba-common-bin
```


## Useful Commands

Edit config:

```
sudo nano /etc/samba/smb.conf
```

Restart service:

```
sudo systemctl restart smbd
```



## Resources

- [Installing Samba Server on Ubuntu 22.04](https://www.youtube.com/watch?v=c0f71Wol8xc)
- [Sharing "/" (root) folder](https://askubuntu.com/questions/60566/i-want-to-share-my-in-samba-how-to-make-it-editable-in-windows-networking)
- [Samba Password Reset](https://ubuntuforums.org/showthread.php?t=1687199)
- [How to Setup a Raspberry Pi Samba Server](https://pimylifeup.com/raspberry-pi-samba/)