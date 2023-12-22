## Create SSH Keypair on Client

Enter command and follow the instructions:

	ssh-keygen -t rsa



## Copy SSH Keys to Server

### macOS / Linux

Execute on *client*; The following command adds client's public key to server's `.ssh/authorized_keys` file:

	ssh-copy-id USERNAME@HOST

### Windows

*Windows server:* Manually copy contents from client's `~/.ssh/id_rsa.pub` to (Windows) server's `USERNAME/.ssh/authorized_keys`.

*Windows client:* Run the following command:

	type $env:USERPROFILE\.ssh\id_rsa.pub | ssh USERNAME@HOST "cat >> .ssh/authorized_keys"



## Server Config (`sshd_config`)

### macOS

**Config location:** `/private/etc/ssh/`

*Required:*

	PasswordAuthentication no
	KbdInteractiveAuthentication no
	PubkeyAuthentication yes		# May be "no" by default
	UsePAM no

*Optional:*

	PermitRootLogin no		# OR "PermitRootLogin prohibit-password" to still allow PubkeyAuthentication

### Linux

**Config location:** `/etc/ssh/`

*Required:*

	PasswordAuthentication no
	ChallengeResponseAuthentication no		# Older versions only; obsolete
	KbdInteractiveAuthentication no			# New version of "KbdInteractiveAuthentication"
	UsePAM no

*Optional:*

	PermitRootLogin no		# OR "PermitRootLogin prohibit-password" to still allow PubkeyAuthentication

### Windows

**Config location:** `%programdata%\ssh\`

*Required:*

Passwordless:

	PasswordAuthentication no
	KbdInteractiveAuthentication no
	# Match Group administrators		# Comment out to enable Admin users to log in
	# AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys		# Comment out to enable Admin users to log in

CLI: Allow inbound connections on port 22:

	netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22



## Restart SSH Server

### macOS

Not sure which is correct:

	sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
	sudo launchctl load /System/Library/LaunchDaemons/ssh.plist

	sudo systemsetup -setremotelogin off
	sudo systemsetup -setremotelogin on

### Linux

	sudo systemctl reload ssh

### Windows

	Stop-Service sshd
	Start-Service sshd
	Get-Service sshd		# Status check



## Troubleshooting

1. Check if `sshd_config` server config file is configured correctly

2. Check if `~/.ssh` folder and its contents have correct permissions:

	ls -la ~/.ssh

	-rw------- [username] [usergroup] authorized_keys
	-rw------- [username] [usergroup] id_rsa
	-rw-r--r-- [username] [usergroup] id_rsa.pub
	-rw-r--r-- [username] [usergroup] known_hosts

3. Helpful troubleshooting command (verbose logging; execute on *server*):

	ssh -v localhost
	ssh -v YOUR_LOCAL_IP



## Resources

### macOS

* [Partial guide](https://medium.com/@stringmeteor/secure-your-macos-remote-ssh-access-by-disabling-password-access-68a92dd732d0)
* [How to Enable SSH on a Mac from CLI](https://osxdaily.com/2016/08/16/enable-ssh-mac-command-line/)

### Linux

* [Full guide](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)

### Windows

* [Full guide](https://gist.github.com/adamelliotfields/16dfac1bacf6d2eeada0582fdfbbb7b6)
* [Key-based authentication in OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
* [Restart a Windows service from CLI](https://superuser.com/questions/301765/restart-a-windows-service-from-the-command-line)
* [OpenSSH Server configuration for Windows Server and Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration)