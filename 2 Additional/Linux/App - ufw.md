## Installation

1. Update packages:

	```
	sudo apt update
	sudo apt upgrade
	```

2. Install `ufw`:

	```
	sudo apt install ufw
	```

3. Verify the installation:

	```
	apt list ufw
	```



## Commands

Enable firewall:

```
sudo ufw enable
```

Disable firewall:

```
sudo ufw disable
```

Display firewall's status and rules:

```
sudo ufw status
```

Display firewall's status and *numbered* rules:

```
sudo ufw status numbered
```

Delete a specific rule:

```
sudo ufw delete [RULE_NUMBER]
```




## Basic Config

**Allow all outgoing** traffic:

```
sudo ufw default allow outgoing
```

**Deny all incoming** traffic:

```
sudo ufw default deny incoming
```

Allow SSH access only from local network (`172.16.0.0/24` in the following examples):

```
sudo ufw allow from 172.16.0.0/24 to any port 22
```

Allow access to Nginx Proxy Manager (NPM) panel only from local network:

```
sudo ufw allow from 172.16.0.0/24 to any port 81
```

Allow access to reverse proxy from anywhere:

```
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Allow access to a specific service (only via NPM; this assumes NPM is installed on 172.16.0.50):

```
sudo ufw allow from 172.16.0.50 to any port [PORT]/tcp 
```



## Resources

- [How to Configure Firewall Rules with UFW](https://www.youtube.com/watch?v=XtRXm4FFK7Q)



## Common services - ADD TO PERSONAL CONFIG FILES


Feishin

sudo ufw allow from 172.16.0.50 to any port 9180/tcp


beszel-agent (MAYBE NOT NECESSARY, CHECK)

sudo ufw allow from 172.16.0.0/24 to any port 45876




Minecraft:

sudo ufw allow from [SERVER_IP] to any port 25565,25566,25567/tcp
sudo ufw allow from [SERVER_IP] to any port 25565,25566,25567/udp

sudo ufw allow from 172.16.0.0/24 to any port 25565,25566,25567/tcp
sudo ufw allow from 172.16.0.0/24 to any port 25565,25566,25567/udp
