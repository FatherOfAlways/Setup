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