## Log2Ram

Installation [`log2ram`](https://github.com/azlux/log2ram):

```
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bookworm main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
sudo apt update && sudo apt upgrade -y
sudo apt install log2ram
```

Check:

```
systemctl status log2ram
```

Increase RAM usage:

```
sudo nano /etc/log2ram.conf
sudo reboot
```


## Troubleshooting

- ['No Space Left on Device'](https://mcuoneclipse.com/2019/04/01/log2ram-extending-sd-card-lifetime-for-raspberry-pi-lorawan-gateway/)