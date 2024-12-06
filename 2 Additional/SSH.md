## Install OpenSSH Server

### macOS / Linux

Already installed.

### Windows

`winget`:

```
winget install -e --id Microsoft.OpenSSH.Beta
```

You can also do it [manually](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui) (loser).


## Create SSH Keypair on Client

Enter command and follow the instructions:

```
ssh-keygen -t rsa
```



## Copy Client's Public SSH Key to Server

Copy contents from client's `~/.ssh/id_rsa.pub` to server's `~/.ssh/authorized_keys`.

```
sudo nano ~/.ssh/authorized_keys
```



## Server Config (`sshd_config`)

*Note:* you may need to restart the SSH Server for any changes to take effect.

### macOS

**Config location:** `/private/etc/ssh/`

```
sudo nano /private/etc/ssh/sshd_config
```

*Required:*

```
PasswordAuthentication no
KbdInteractiveAuthentication no
PubkeyAuthentication yes				# May be "no" by default
UsePAM no
```

*Optional:*

```
PermitRootLogin no			# OR "PermitRootLogin prohibit-password" to still allow PubkeyAuthentication
```

### Linux

**Config location:** `/etc/ssh/`:

```
sudo nano /etc/ssh/sshd_config
```

*Required:*

```
PasswordAuthentication no
ChallengeResponseAuthentication no			# OBSOLETE; older versions only
KbdInteractiveAuthentication no				# New version of "ChallengeResponseAuthentication"
PubkeyAuthentication yes					# May be "no" by default
UsePAM no
```

*Optional:*

```
PermitRootLogin no		# OR "PermitRootLogin prohibit-password" to still allow PubkeyAuthentication
```

<span style="color: red">**!!! WARNING !!!**</span>

<span style="color: red">**On some systems *(khm, Ubuntu Server, khm)* additional config files may be created in `/etc/ssh/sshd_config.d/` which will override `/etc/ssh/sshd_config` settings so test your config after modifications and make appropriate changes (like adding an overriding config file) if necessary. More info [here](https://askubuntu.com/questions/1516262/why-is-50-cloud-init-conf-created).**</span>


### Windows

**Config location:** `%programdata%\ssh\`

*Required:*

```
PasswordAuthentication no
KbdInteractiveAuthentication no
# Match Group administrators		# Comment out to enable Admin users to log in
# AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys		# Comment out to enable Admin users to log in
```

CLI: Allow inbound connections on port 22:

```
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22
```


## Restart SSH Server

### macOS

Not sure which is correct:

```
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
sudo launchctl load /System/Library/LaunchDaemons/ssh.plist
```

```
sudo systemsetup -setremotelogin off
sudo systemsetup -setremotelogin on
```

### Linux

```
sudo systemctl reload ssh
```

### Windows

```
Stop-Service sshd
Start-Service sshd
Get-Service sshd		# Status check
```



## Troubleshooting

### General

1. Check if `sshd_config` server config file is configured correctly

2. Check if `~/.ssh` folder and its contents have correct permissions:

```
ls -la ~/.ssh
```

```
-rw------- [username] [usergroup] authorized_keys
-rw------- [username] [usergroup] id_rsa
-rw-r--r-- [username] [usergroup] id_rsa.pub
-rw-r--r-- [username] [usergroup] known_hosts
```

3. Helpful troubleshooting command (verbose logging; execute on *server*):

```
ssh -v localhost
ssh -v YOUR_LOCAL_IP
```

### Warning: Remote Host Identification Has Changed

[Remove all keys belonging to a given hostname](https://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed) from `known_hosts` file (replace ALL_CAPS text with appropriate values):

```
ssh-keygen -R HOST_IP
```



## Resources

### macOS

* [Partial guide](https://medium.com/@stringmeteor/secure-your-macos-remote-ssh-access-by-disabling-password-access-68a92dd732d0)
* [How to Enable SSH on a Mac from CLI](https://osxdaily.com/2016/08/16/enable-ssh-mac-command-line/)

### Linux

* [Full guide](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)
* [5 Steps to Secure Linux (protect from hackers)](https://www.youtube.com/watch?v=ZhMw53Ud2tY)

### Windows

* [Full guide](https://gist.github.com/adamelliotfields/16dfac1bacf6d2eeada0582fdfbbb7b6)
* [Key-based authentication in OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
* [Restart a Windows service from CLI](https://superuser.com/questions/301765/restart-a-windows-service-from-the-command-line)
* [OpenSSH Server configuration for Windows Server and Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration)