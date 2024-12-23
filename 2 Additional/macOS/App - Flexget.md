## Installation

Documentation [here](https://flexget.com/Install).

1. Prerequisites: Homebrew (w/ Xcode Command Line Tools), python installed

2. Upgrade `pip`:

	```
	pip3 install --upgrade pip
	pip3 install --upgrade setuptools
	```

3. Install FlexGet:

	```
	pip3 install --upgrade flexget
	```

4. Install `transmission-rpc`:

	```
	pip3 install transmission-rpc
	```

5. Enable Transmission Remote

6. Create Launch Agent `~/Library/LaunchAgents/com.flexget.plist` with:

	```
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>Label</key>
		<string>com.flexget</string>
		<key>ProgramArguments</key>
		<array>
			<string>/opt/homebrew/bin/flexget</string>
			<string>--cron</string>
			<string>execute</string>
		</array>
		<key>Nice</key>
		<integer>1</integer>
		<key>StartInterval</key>
		<integer>900</integer>
		<key>RunAtLoad</key>
		<true/>
	</dict>
	</plist>
	```

	*Note: Type `which flexget` to find out where the FlexGet binary is located and modify `com.flexget.plist` accordingly.*

7. Run the Launch Agent:

	```
	launchctl load -w ~/Library/LaunchAgents/com.flexget.plist
	```

8. Check if Flexget is running:

	```
	launchctl list | grep flexget
	```



## Regular use

List all commands:

```
flexget --help
```

If you want to check if Flexget is running:

```
launchctl list | grep flexget
```

If the process is running, you’ll see a process ID in the first column, followed by the last exit status. If the second column isn’t 0, check your log file for errors.

View task health status:

```
flexget status
```

Validate configuration file and print errors:

```
flexget check
```

This command executes all tasks, but doesn’t write anything to the disk:

```
flexget --test execute
```

Execute tasks now:

```
flexget execute
```



## Daemon

To launch the FlexGet daemon, use the start command *(Note: Using the optional `-d` switch will send the FlexGet daemon to the background. Using `--autoreload-config` will force config reloads before task execution.)*:

```
flexget daemon start -d --autoreload-config
```

[Daemon](https://flexget.com/Daemon) stuff:

```
launchctl load -w /Users/tomazfidel/Library/LaunchAgents/com.flexget.plist
launchctl unload /Users/tomazfidel/Library/LaunchAgents/com.flexget.plist
```



## Upgrading

Required Upgrading Actions (list of potentially breaking changes) available [here](https://flexget.com/UpgradeActions).

Start by checking what version you currently have with command:

```
flexget -V
```

Upgrade with PIP

```
pip3 install --upgrade flexget
```