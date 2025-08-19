## Reverse Proxy Config

If you want to hide your server's IP.

1. *Prerequisite:* nginx installed.

2. Install the nginx-extras Package

	```
	sudo apt-get install nginx-extras
	```

3. Open main configuration file:

	```
	sudo nano /etc/nginx/nginx.conf
	```

4. Find the http block and add the stream block after it:

	```
	stream {
		server {
			listen 25565;
			proxy_pass YOUR_MINECRAFT_SERVER_IP:25565;
		}
	}
	```

5. Verify the configuration:

	```
	sudo nginx -t
	```

6. Restart nginx

	```
	sudo systemctl restart nginx
	```



## Uptime Kuma Config

- Monitor Type: **TCP Port**
- Hostname: ***[Minecraft Server IP]***
- Port: **25565**