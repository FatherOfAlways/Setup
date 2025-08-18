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

- [The ULTIMATE Pi-hole Setup? (Pi-hole, Unbound, Nebula Sync, Keepalived)](https://www.youtube.com/watch?v=6sznCZ7ttbI)
- [Required Ports](https://docs.pi-hole.net/main/prerequesites/)

*Log2Ram*

- [Documentation](https://github.com/azlux/log2ram#installation)

*Blocklists:*

- [Firebog - The Big Blocklist Collection](https://firebog.net/)

*Remotes:*

- macOS: [PiBar](https://github.com/amiantos/pibar) / [Pi Stats](https://github.com/Bunn/PiStats)
- iOS: [Pi-hole Remote](https://rocketscience-it.nl/)