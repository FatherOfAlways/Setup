## Installation

*Prerequisite: Docker, Docker Compose, Docker network 'proxy-intranet' created*

Docker compose:

```yaml
services:
  app:
    image: jc21/nginx-proxy-manager:latest
    ports:
      - 80:80
      - 81:81
      - 443:443
    environment:
      DB_MYSQL_HOST: db
      DB_MYSQL_PORT: 3306
      DB_MYSQL_USER: foa
      DB_MYSQL_PASSWORD: ${PASSWORD}
      DB_MYSQL_NAME: foa
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    extra_hosts:
      - host.docker.internal:host-gateway
    restart: unless-stopped
    networks:
      - proxy-intranet
  db:
    image: jc21/mariadb-aria:latest
    environment:
      MYSQL_ROOT_PASSWORD: ${PASSWORD}
      MYSQL_DATABASE: foa
      MYSQL_USER: foa
      MYSQL_PASSWORD: ${PASSWORD}
    volumes:
      - ./mysql:/var/lib/mysql
    restart: unless-stopped
    networks:
      - proxy-intranet
networks:
  proxy-intranet:
    external: true
```



## Docker File Management

*Prerequisite:* Navigate to `/opt/nginxproxymanager` (if not already there):

```
cd /opt/stacks/nginxproxymanager/
```

Run the app:

```
sudo docker compose up -d
```

Stop the app:

```
sudo docker compose down
```

Stop services individually:

```
sudo docker container stop nginxproxymanager-app-1
sudo docker container stop nginxproxymanager-db-1
```



## Usage

IP: `http://[HOST_ADDRESS]:81`



## Resources

*Installation:*

- [Official Page](https://nginxproxymanager.com/setup/)
- [Nginx Proxy Manager - How-To Installation and Configuration](https://www.youtube.com/watch?v=P3imFC7GSr0)
- [Nginx Proxy Manager - SSL Wildcard Certs For Your Entire Domain](https://www.youtube.com/watch?v=TBGOJA27m_0)
- [Quick and Easy Local SSL Certificates for Your Homelab!](https://www.youtube.com/watch?v=qlcVx-k-02E)
- [Self-Hosted SSL Simplified: Nginx Proxy Manager](https://www.youtube.com/watch?v=jx6T6lqX-QM)

*Troubleshooting:*

- [How to clear Brave's DNS cache](https://www.reddit.com/r/brave_browser/comments/1hcach6/how_to_clear_brave_dns_cache/) + [Direct link](brave://net-internals/#dns)
- [Fix “Too many redirects” error after enabling Cloudflare Proxy](https://medium.com/@flaviocopes/fix-too-many-redirects-error-after-enabling-cloudflare-proxy-7fb94fe98989)