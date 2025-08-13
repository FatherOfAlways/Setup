## Updating

```
ssh pi@HOST_ADDRESS -p 22
sudo apt-get update
sudo apt-get upgrade
pihole -up
pihole -g
```



## Nginx Proxy Manager Config

### Pi-hole

1. SSH into your Raspberry Pi.

2. Open `/etc/pihole/pihole-FTL.conf`:

	```
	sudo nano /etc/pihole/pihole-FTL.conf
	```

3. Add the following line to the end of the file:

	```
	TRUSTED_PROXIES=172.16.0.0/12
	```

	This line tells Pi-hole that requests coming from your Nginx Proxy Manager server (which is within the 172.16.0.0/12 range) are trusted and should be processed correctly.

4. Save and exit the file.

5. Restart the Pi-hole's FTL service to apply the changes:

	```
	sudo pihole restartdns
	```

### NPM

1. Go to *Hosts > Proxy Hosts* and edit your Pi-hole entry.

2. Click the *Advanced* tab.

3. Add the following line before the other proxy_set_header lines:

	```
	rewrite ^/$ /admin redirect;
	proxy_set_header Host $host;
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Forwarded-Proto $scheme;
	```

	This config will redirect any request to the root URL (/) to the /admin path, which is where the Pi-hole dashboard is located.

4. Save the proxy host.



## Resources

*Pi-hole Installation:*

- [Installation Guide (2023)](https://www.youtube.com/watch?v=xtMFcVx3cHU)
- [LTT Guide](https://linustechtips.com/main/topic/1094810-pi-hole-setup-tutorial/)
- [Required Ports](https://docs.pi-hole.net/main/prerequesites/)

*Log2Ram*

- [Documentation](https://github.com/azlux/log2ram#installation)

*Blocklists:*

- [Firebog - The Big Blocklist Collection](https://firebog.net/)

*Remotes:*

- Chrome: [Remote Switch for Pi-Hole](https://chrome.google.com/webstore/detail/remote-switch-for-pi-hole/nkkklnmkpmobgcbkipccdjahpcgbhnki/related?hl=en)
- iOS [PiHole Admin iOS Shortcut](https://www.reddit.com/r/pihole/comments/9koft9/pihole_admin_ios_shortcut/)
- macOS: [Pi Stats](https://github.com/Bunn/PiStats)
