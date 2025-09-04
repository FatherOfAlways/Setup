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