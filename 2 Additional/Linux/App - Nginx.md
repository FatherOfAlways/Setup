## General

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



## Stream Config (Minecraft)

This config reroutes traffic via a "middle man" server, obfuscating your main server's IP.

*Prerequisite:* `nginx` installed.

1. Install the `nginx-extras` package:

	```
	sudo apt-get install nginx-extras
	```

2. Open main configuration file:

	```
	sudo nano /etc/nginx/nginx.conf
	```

3. Find the http block and add the stream block after it:

	```
	stream {
		server {
			listen 25565;
			proxy_pass YOUR_MINECRAFT_SERVER_IP:25565;
		}
	}
	```

4. Verify the configuration:

	```
	sudo nginx -t
	```

5. Restart nginx

	```
	sudo systemctl restart nginx
	```



## Reverse Proxy Template

```
server {
    listen 80;
    server_name MY_DOMAIN.COM;

    location / {
        proxy_pass http://localhost:MY_PORT;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```