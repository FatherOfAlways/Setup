## Installation

1. Update system:

	```
	sudo apt update
	sudo apt upgrade
	```

2. Install using the convenience script:

	```
	curl -sSL https://get.docker.com | sh
	```

3. Add your user *(current user)* to the `docker` group:

	```
	sudo usermod -aG docker $USER
	```

4. Reboot:

	```
	sudo reboot
	```

5. Check if your user was added to the `docker` group:

	```
	groups
	```

6. Verify:

	```
	sudo docker run hello-world
	```



## Useful Commands

Show running containers:

```
sudo docker ps
```

Run a container:

```
cd /path/to/compose/file/
sudo docker compose up -d
```

Stop a container:

```
cd /path/to/compose/file/
sudo docker compose down
```

Create a new network:

```
sudo docker network create NETWORK_NAME
```



## Resources

- [Documentation](https://docs.docker.com/engine/install/ubuntu/)
- [PiMyLifeUp: Installing Docker on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-docker/)