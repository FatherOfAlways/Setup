## Installation

Docker Compose:

```yaml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - ./uptime-kuma-data:/app/data
    ports:
      - 3001:3001
    restart: unless-stopped
```



## Usage

IP: `http://[HOST_ADDRESS]:3001`



## Resources

- [Uptime Kuma GitHub](https://github.com/louislam/uptime-kuma)
- [Docker Compose Template](https://github.com/louislam/uptime-kuma/blob/1.23.X/docker/docker-compose.ymlhttps://github.com/louislam/uptime-kuma/blob/1.23.X/docker/docker-compose.yml)
- [Installing NodeJS on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-nodejs/)
- [Setting up Uptime Kuma on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-uptime-kuma/)