## Installation

[Docker Compose](https://dockge.kuma.pet/):

```yaml
services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    #ports:
    #  - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
      # Stacks Directory
      # ⚠️ READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH.
      # ⚠️ 1. FULL path only. No relative path (MUST)
      # ⚠️ 2. Left Stacks Path === Right Stacks Path (MUST)
      - /opt/stacks:/opt/stacks
    environment:
      # Tell Dockge where to find the stacks
      - DOCKGE_STACKS_DIR=/opt/stacks
    networks:
      - proxy-intranet
networks:
  proxy-intranet:
    external: true
```



## Usage

IP: `http://[HOST_ADDRESS]:5001`



## Notes

If you have existing containers, either change *dockge*'s default Stacks Directory or move them to the default Stacks Directory (`/opt/stacks`). If you don't do either, *dockge* will not be able to manage them.



## Resources

- [This Docker Compose UI is amazing! // Dockge](https://www.youtube.com/watch?v=HEklvsr7q54)