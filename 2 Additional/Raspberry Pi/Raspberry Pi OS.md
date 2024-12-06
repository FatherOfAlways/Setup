## Upgrade

Guide used [here](https://www.youtube.com/watch?v=gSmFS3HfkPg).

1. Update packages:

	```
	sudo apt update
	```

2. Update firmware:

	```
	sudo rpi-update
	```

3. Reboot:

	```
	sudo reboot
	```

4. Open `sources.list` file:

	```
	sudo nano /etc/apt/sources.list
	```

5. Find the line after the URL (`bookworm` as of 2024) and change it to the name of the new release.

6. Update/upgrade packages, upgrade distro:

	```
	sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
	```



## Resources

*Raspberry Pi Setup:*

- Raspbian Buster Lite: https://www.raspberrypi.org/downloads/raspbian/
- Copying an operating system image to an SD card using Mac OS: https://www.raspberrypi.org/documentation/installation/installing-images/mac.md
- Securing your Raspberry Pi: https://www.raspberrypi.org/documentation/configuration/security.md


*How to Update to the Latest Raspberry Pi OS:*

- Guide: https://www.makeuseof.com/tag/raspberry-pi-update-raspbian-os/
- Rasbian versions website: https://www.raspberrypi.com/software/operating-systems/