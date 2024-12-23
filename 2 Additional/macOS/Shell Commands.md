## Sources

- https://beebom.com/mac-terminal-commands-access-hidden-features/

* * *



## App/System Restart

All these services should automatically restart after they have been killed. If for some reason they won't, you're probably better off just rebooting (to be sure, the "Shut Down" option from the Finder/Menu bar will probably not help, just go to the Terminal and type: `sudo shutdown -r now`, provide your Admin password and your machine should restart.

**Kill almost all of the running applications on the currently logged in user:**

```
launchctl reboot apps
```

**Restart all user applications without rebooting the entire system:**

```
launchctl reboot userspace
```

**Force restart:**

```
sudo shutdown -r now "Force Reboot in Progress"
```

**Restart Finder:**  

```
killall -KILL Finder  
```

**Restart Dock/Spaces:**  

```
killall -KILL Dock
```

**Restart Menubar:**  

```
killall -KILL SystemUIServer
```



## Display

**Create a Custom Login Message:**

```
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "[YOUR_MESSAGE_HERE]"  
```

**Minimize Effects:**

- Suck Effect (Hidden Effect):

	```
	defaults write com.apple.dock mineffect -string suck && killall Dock
	```

- Scale Effect:

	```
	defaults write com.apple.dock mineffect -string scale && killall Dock
	```

- Genie Effect:

	```
	defaults write com.apple.dock mineffect -string genie && killall Dock
	```



## Symlinks

```
┌── ln(1) link, ln -- make links
│   ┌── Create a symbolic link.
│   │                         ┌── the optional path to the intended symlink
│   │                         │   if omitted, symlink is in . named as destination
│   │                         │   can use . or ~ or other relative paths
│   │                   ┌─────┴────────┐
ln -s /path/to/original /path/to/symlink
	└───────┬───────┘
			└── the path to the original file/folder
				can use . or ~ or other relative paths
```



## Other

**Convert Audio File to iPhone Ringtone:**

```
afconvert input.mp3 ringtone.m4r -f m4af
```

**Delete files with Errors:**

```
sudo rm -RF PATH_TO_FILE
```