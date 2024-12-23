## Installation

### Node.JS

1. Install packages needed to access Nodesource repository:

	```
	sudo apt install -y ca-certificates curl gnupg
	```

2. Download Nodesource GPG key and store it in `“/usr/share/keyrings”` directory:

	```
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
	```

3. Decide which NodeJS version to install:

- LTS: `NODE_MAJOR=18`
- Current: `NODE_MAJOR=20`

4. Add Node.JS repository to sources list:

	```
	echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
	```

5. Update package list again: 

	```
	sudo apt update
	```

6. Install Node.JS:

	```
	sudo apt install nodejs
	```

7. Verify installation:

	```
	node -v
	```

9. Install Additional Development Tools:

	```
	sudo apt install build-essential
	```



### Uptime Kuma

1. Update packages:

	```
	sudo apt update
	sudo apt upgrade
	```

2. Install `git`:

	```
	sudo apt install git
	```

3. Clone Uptime Kuma repository to device:

	```
	git clone https://github.com/louislam/uptime-kuma.git
	```

4. Navigate to repository directory:

	```
	cd uptime-kuma
	```

5. Set up Uptime Kuma:

	```
	npm run setup
	```

6. Install the `pm2` using `npm`:

	```
	sudo npm install -g pm2
	```

7. install `pm2` module called `pm2-logrotate`:

	```
	pm2 install pm2-logrotate
	```

8. Start up Uptime Kuma:

	```
	pm2 start server/server.js --name uptime-kuma
	```

9. “Save” the currently running programs so we can resume them later:

	```
	pm2 save
	```

10. Generate a command needed to run to get Uptime Kuma to start at boot:

	```
	pm2 startup
	```

11. After running the above command, you will need to run the command printed into the Terminal.




## Usage

IP: `http://[HOST_ADDRESS]:3001`

* * *



## Updating

Navigate to Uptima Kuma directory:

```
cd ~/uptime-kuma
git pull
npm run setup
pm2 restart uptime-kuma
```



## Resources

- Uptime Kuma GitHub: https://github.com/louislam/uptime-kuma
- Installing NodeJS on the Raspberry Pi: https://pimylifeup.com/raspberry-pi-nodejs/
- Setting up Uptime Kuma on the Raspberry Pi: https://pimylifeup.com/raspberry-pi-uptime-kuma/