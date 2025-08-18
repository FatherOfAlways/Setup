## Installation

1. Create a new user:

	```
	sudo useradd -m -d /home/navidrome navidrome
	```

2. Update and install Prerequisites:

	```
	sudo apt update
	sudo apt upgrade
	sudo apt install vim ffmpeg
	```

3. Create directory structure:

	```
	sudo install -d -o navidrome -g navidrome /opt/navidrome
	sudo install -d -o navidrome -g navidrome /var/lib/navidrome
	```

4. Get Navidrome - go to the [releases page](https://github.com/navidrome/navidrome/releases) and replace the URL below:

	```
	wget https://github.com/navidrome/navidrome/releases/download/v0.XX.X/navidrome_0.XX.X_linux_amd64.tar.gz -O Navidrome.tar.gz
	sudo tar -xvzf Navidrome.tar.gz -C /opt/navidrome/
	sudo chmod +x /opt/navidrome/navidrome
	sudo chown -R navidrome:navidrome /opt/navidrome
	```

5. Create a configuration file:

   * Create:

		```
		cd /var/lib/navidrome
		sudo touch navidrome.toml
		sudo nano navidrome.toml
		```

   * Contents:

		```
		MusicFolder = "/home/navidrome/music"
		```

6. Edit mucic folder permissions (replace location if different):

	```
	sudo chown navidrome:navidrome /home/navidrome/ -R
	sudo chmod 2775 /home/navidrome/music -R
	```

7. Set up Navidrome service:

    * Create:

		```
		cd /etc/systemd/system/
		sudo touch navidrome.service
		sudo nano navidrome.service
		```


   * Contents:

		```
		[Unit]
		Description=Navidrome Music Server and Streamer compatible with Subsonic/Airsonic
		After=remote-fs.target network.target
		AssertPathExists=/var/lib/navidrome

		[Install]
		WantedBy=multi-user.target

		[Service]
		User=navidrome
		Group=navidrome
		Type=simple
		ExecStart=/opt/navidrome/navidrome --configfile "/var/lib/navidrome/navidrome.toml"
		WorkingDirectory=/var/lib/navidrome
		TimeoutStopSec=20
		KillMode=process
		Restart=on-failure

		# See https://www.freedesktop.org/software/systemd/man/systemd.exec.html
		DevicePolicy=closed
		NoNewPrivileges=yes
		PrivateTmp=yes
		PrivateUsers=yes
		ProtectControlGroups=yes
		ProtectKernelModules=yes
		ProtectKernelTunables=yes
		RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
		RestrictNamespaces=yes
		RestrictRealtime=yes
		SystemCallFilter=~@clock @debug @module @mount @obsolete @reboot @setuid @swap
		ReadWritePaths=/var/lib/navidrome

		# You can uncomment the following line if you're not using the jukebox This
		# will prevent navidrome from accessing any real (physical) devices
		PrivateDevices=yes

		# You can change the following line to `strict` instead of `full` if you don't
		# want navidrome to be able to write anything on your filesystem outside of
		# /var/lib/navidrome.
		ProtectSystem=full

		# You can uncomment the following line if you don't have any media in /home/*.
		# This will prevent navidrome from ever reading/writing anything there.
		#ProtectHome=true

		# You can customize some Navidrome config options by setting environment variables here. Ex:
		#Environment=ND_BASEURL="/navidrome"
		```

	* Start service:

		```
		sudo systemctl daemon-reload
		sudo systemctl start navidrome.service
		sudo systemctl status navidrome.service
		```

	* Set up start at boot:

		```
		sudo systemctl enable navidrome.service
		```



## Usage

IP: `http://[HOST_ADDRESS]:4533`



## Updating

1. Get the latest executable on the [releases page](https://github.com/navidrome/navidrome/releases) and replace the URL below:

	```
	wget https://github.com/navidrome/navidrome/releases/download/v0.XX.X/navidrome_0.XX.X_linux_amd64.tar.gz -O Navidrome.tar.gz
	```

2. Stop Navidrome:

	```
	sudo systemctl stop navidrome.service
	```

3. Extract the archive to the app's location and fix the permissions/ownership:

	```
	sudo tar -xvzf Navidrome.tar.gz -C /opt/navidrome/
	sudo chmod +x /opt/navidrome/navidrome
	sudo chown -R navidrome:navidrome /opt/navidrome
	```

4. Start Navidrome:

	```
	sudo systemctl start navidrome.service
	```



## Resources

- [Documentation](https://www.navidrome.org/docs/installation/linux/)