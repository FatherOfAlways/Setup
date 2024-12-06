## Installation

Install [`tightvncserver`](https://www.tightvnc.com/download.php):

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install tightvncserver
```

## Configuration
	
```
vncserver
```

## Usage

* Check if TightVNC is running (checking for port 5901):

	```
	netstat -na | grep "5901"
	```

* Run TightVNC desktop on port 5901:

	```
	vncserver -geometry 1920x1080 -depth 24 :1
	```

* Quit TightVNC desktop on port 5901:

	```
	vncserver -kill :1
	```
