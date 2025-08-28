## Installation

Docker compose:

```yaml
services:
  beszel:
    image: henrygd/beszel:latest
    container_name: beszel
    restart: unless-stopped
    ports:
      - 8090:8090
    volumes:
      - ./beszel_data:/beszel_data
      - ./beszel_socket:/beszel_socket
```


## Troubleshooting

### [Error getting container stats](https://akashrajpurohit.com/blog/resolving-missing-memory-stats-in-docker-stats-on-raspberry-pi/)

**Error:**

`beszel-agent  | 2025/08/14 20:43:58 ERROR Error getting container stats err="beszel-agent - no memory stats - see https://github.com/henrygd/beszel/issues/144"`

**Solution:**

1. Verify docker info:

	```
	docker info | grep -i cgroup
	```

	If the values are not set, run the command `docker info` without `grep` and you should be seeing these warnings at the end:

	`WARNING: No memory limit support`  
	`WARNING: No swap limit support`

2. Modify the `cmdline.txt`:

	```
	sudo nano /boot/firmware/cmdline.txt
	```

	Usually the file is located at `/boot/cmdline.txt` but it might be somewhere else like `/boot/firmware/cmdline.txt`.
	
3. Add these options to the end of the line:

	```
	cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1
	```

4. Save and exit the file and reboot:

	```
	sudo reboot
	```



## Resources

- [Documentation](https://beszel.dev/guide/what-is-beszel)
- [Agent Installation](https://beszel.dev/guide/agent-installation)