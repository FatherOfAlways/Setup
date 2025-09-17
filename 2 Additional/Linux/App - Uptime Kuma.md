## Installation

[Docker Compose](https://github.com/louislam/uptime-kuma/blob/1.23.X/docker/docker-compose.yml):

```yaml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - ./uptime-kuma-data:/app/data
    environment:
      - TZ=Europe/Ljubljana
    ports:
      - 3001:3001
    restart: unless-stopped
networks: {}
```



## Usage

IP: `http://[HOST_ADDRESS]:3001`



## Resources

- [Uptime Kuma GitHub](https://github.com/louislam/uptime-kuma)
- [Installing NodeJS on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-nodejs/)
- [Setting up Uptime Kuma on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-uptime-kuma/)