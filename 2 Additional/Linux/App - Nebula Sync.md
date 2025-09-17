## Installation

[Docker Compose](https://github.com/lovelaze/nebula-sync):

```yaml
services:
  nebula-sync:
    image: ghcr.io/lovelaze/nebula-sync:latest
    container_name: nebula-sync
    restart: unless-stopped
    env_file: .env
```

`.env` file:


```yaml
PRIMARY="http://ph1.example.com|PASSWORD"  # Be sure to add quotes if you have special characters
REPLICAS="http://ph2.example.com|PASSWORD,http://ph3.example.com|PASSWORD" # Be sure to add quotes if you have special characters
FULL_SYNC=false
RUN_GRAVITY=false
CRON=*/15 * * * *

# CLIENT_SKIP_TLS_VERIFICATION=true # If you have SSL enabled

TZ=Europe/Ljubljana

SYNC_CONFIG_DNS=true
SYNC_CONFIG_DHCP=true
SYNC_CONFIG_NTP=true
SYNC_CONFIG_RESOLVER=true
SYNC_CONFIG_DATABASE=true
SYNC_CONFIG_MISC=true
SYNC_CONFIG_DEBUG=true

SYNC_GRAVITY_DHCP_LEASES=true
SYNC_GRAVITY_GROUP=true
SYNC_GRAVITY_AD_LIST=true
SYNC_GRAVITY_AD_LIST_BY_GROUP=true
SYNC_GRAVITY_DOMAIN_LIST=true
SYNC_GRAVITY_DOMAIN_LIST_BY_GROUP=true
SYNC_GRAVITY_CLIENT=true
SYNC_GRAVITY_CLIENT_BY_GROUP=true
```



## Resources

- [Documentation](https://github.com/lovelaze/nebula-sync)
- [The ULTIMATE Pi-hole Setup? (Pi-hole, Unbound, Nebula Sync, Keepalived)](https://www.youtube.com/watch?v=6sznCZ7ttbI)
- [Pi-hole Syncing… But Smarter... (Video)](https://www.youtube.com/watch?v=OcSBggDyeJ4)
- [Pi-hole Syncing… But Smarter... (Notes)](https://technotim.live/posts/pihole-sync-nebula/)