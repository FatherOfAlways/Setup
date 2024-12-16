## Windows Reset

1. Win+R > `ms-settings:recovery` > [**Reset this PC**](https://support.microsoft.com/en-us/windows/give-your-pc-a-fresh-start-0ef73740-b927-549b-b7c9-e6f2b48d275e)

2. Options:

	* Step 1: _Remove everything_
	* Step 2: _Cloud download_
	* Step 3: _Change settings_ > Make sure "_Delete files from all my devices_" is set to **NO!**


## Windows Install

[**Debloat Windows 11 Installation**](https://www.youtube.com/watch?v=mZm6mY3I7J4)

1. On the first screen, under _Time and currency format_, select `English (World)`
2. During the installation you may receive `OOBEREGION` error - not to worry, this is normal
3. Once Windows is installed, navigate to _Settings > Time & language > Language & region > Region > Country or region_ and set the correct region.


[**Bypass Microsoft Account Requirement in Windows 11**](https://hwbusters.com/quick-tips/quick-tips-6-bypass-microsoft-account-in-windows-11-the-hard-way/)

1. Physically disconnect network cable from computer.
2. Follow the installer until it asks to connect to Wifi
3. Bring up the Command Prompt _(Shift+F10)_
4. Enter the following and hit _Enter_:

	```
	OOBE\BYPASSNRO
	```

5. Sign in to Microsoft account after the installation completes.


## Apps

1. Install Windows Updates

2. Install [`winget`](https://github.com/microsoft/winget-cli) _**(already installed on W11 22H2)**_:

	1. User Account Control must be turned _ON_
	2. Download [`winget-cli`](https://github.com/microsoft/winget-cli/releases/) (\*.msixbundle)
	3. Run PowerShell as Admin
	4. Execute: `add-appxpackage "\PATH\TO\DOWNLOADED\FILE"`

3. Install [`choco`](https://chocolatey.org/install):

	```
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
	```

4. Install `winget` packages from [**export**](https://www.dropbox.com/sh/b00ss7490cw85el/AADWWWtufV2_Gd9xLIOrN9OYa?dl=0):

	```
	winget import -i "\PATH\TO\DOWNLOADED\EXPORT.json" --accept-package-agreements --accept-source-agreements
	```

5. Install `choco` packages from [**export**](https://www.dropbox.com/sh/nnnxiqfkyn2k1ye/AAAkW8zn-hPDizY1nedZAWQra?dl=0):

	```
	choco install -y "\PATH\TO\DOWNLOADED\EXPORT.config"
	```

6. Install the rest manually.
	

## Tweaks

### Required

1. Set up [**Resilio Sync**](https://www.resilio.com/):

	1. [**Link new device**](https://help.resilio.com/hc/en-us/articles/205457815-Sync-Private-Identity-Linking-My-Devices) to Identity (as **Disconnected!**).
	2. Set up sync folders.
	3. Disable [**"Store deleted files in folder archive"**](https://help.resilio.com/hc/en-us/articles/205458125-Folder-Preferences).

2. Import & apply [**WinAero Tweaker**](https://winaero.com/winaero-tweaker/) config & **restart computer**

3. Restore [**PowerToys**](https://github.com/microsoft/PowerToys) config.

4. Configure [**Language Bar Stuff**](https://beebom.com/how-remove-language-switcher-windows-11-taskbar/), disable [**Keyboard Layout Hotkey**](https://superuser.com/a/1428326):

	1. Win+R > `ms-settings:keyboard` - _Make sure your primary language is the only one available, remove others_
	2. Win+R > `ms-settings:typing` > Advanced keyboard settings > Use the desktop language bar when it is available - _Must be checked_
	3. Win+R > `ms-settings:typing` > Advanced keyboard settings > Language bar options > Language bar > Hidden - _Must be selected_
	4. Win+R > `ms-settings:typing` > Advanced keyboard settings > Language bar options > Advanced Key Settings - _Disable the hotkeys_

5. Disable [**Clipboard History**](https://www.elevenforum.com/t/enable-or-disable-clipboard-history-in-windows-11.973/):

	1. Win+R > `gpedit.msc` (Local Group Policy Editor)
	2. Navigate to `Computer Configuration\Administrative Templates\System\OS Policies`
	3. Open the *Allow Clipboard History* policy
	4. Select *Not Configured* and click *OK*
	5. Restart the computer to apply

6. Disable Caps Lock through one of the options below:

	* [PowerToys](https://www.ricksdailytips.com/disable-caps-lock-key/) - *Preferred option*
	* [NumLocker](https://www.makeuseof.com/windows-10-11-disable-caps-lock/#how-to-disable-caps-lock-with-numlocker)
	* [Regedit](https://www.makeuseof.com/windows-10-11-disable-caps-lock/#how-to-disable-caps-lock-by-editing-the-registry)

7. Adjust your screen's dynamic range (nVidia only):

	1. Open *nVidia Control Panel*
	2. Navigate to *Display > Change resolution > 3. Apply the following settings*
	3. Select the following dropdown options:

		* *Desktop color depth:* **Highest (32-bit)**
		* *Output color format:* **RGB**
		* *Output color depth:* **10 bpc**
		* *Output dynamic range:* **Full**

### Optional

1. [Change Boot Order](https://www.intowindows.com/4-ways-to-change-the-boot-order-in-windows-10/):

	1. Win+R > `msconfig`  (System Configuration)
	2. Switch to *Boot* tab
	3. Select the desired operating system and click *Set as default*, then click *OK*

2. [Change OS Name in Boot Options at Startup](https://www.tenforums.com/tutorials/22540-change-operating-system-name-boot-options-startup-windows-10-a.html):

	1. Open an elevated command prompt
	2. Type `bcdedit` and press Enter.
	3. Under each Windows Boot Loader section, look for the OS description you want to change the name of, and make a note of its identifier
	4. Type the command below in the command prompt, and press *Enter*:

		```
		bcdedit /set {IDENTIFIER} description "NEW_NAME"
		```

3. Uninstall [**Feedback Hub**](https://superuser.com/questions/1221259/how-do-i-disable-windows-f).


## Shell

1. _Assumption: [**Windows Terminal**](https://github.com/microsoft/terminal), [**PowerShell 7**](https://github.com/PowerShell/PowerShell), [**winget**](https://github.com/microsoft/winget-cli), [OpenSSH](https://github.com/PowerShell/Win32-OpenSSH) are already installed (through steps above or otherwise)._

	_Just in case - formulas below:_

	```
	winget install -e --id Microsoft.PowerShell
	winget install -e --id Microsoft.WindowsTerminal
	winget install -e --id Microsoft.OpenSSH.Beta
	```

2. Install [**Oh My Posh**](https://ohmyposh.dev/docs/installation/windows):

	```
	winget install JanDeDobbeleer.OhMyPosh -s winget
	```

3. Install [**Nerd Fonts**](https://www.nerdfonts.com/):

	1. Run the [**`oh-my-posh installer`**](https://ohmyposh.dev/docs/installation/fonts):

		```
		oh-my-posh font install
		```

	2. Install `Meslo`.
	3. Restart Terminal.
	4. Terminal > Settings (Ctrl + ,) > Profiles > Defaults > Apperance > Font Face > `MesloLGSDZ NF`.
	5. _ALTERNATIVE: Install [**`MesloLGS NF Regular.ttf`**](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf) manually._

4. Install [**Modules**](https://www.powershellgallery.com/):

	```
	Install-Module -Name PSReadLine -RequiredVersion 2.2.2
	Install-Module -Name Terminal-Icons
	```

5. Edit `$profile`:

	```
	notepad $profile
	```

6. Restore [**PowerShell**](https://github.com/PowerShell/PowerShell) Profiles from backup:

	```
	C:\Users\USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
	C:\Users\USERNAME\Documents\PowerShell\Microsoft.VSCode_profile.ps1
	```

7. Restore [**Windows Terminal**](https://github.com/microsoft/terminal) Settings:

	```
	C:\Users\USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
	```

8. Configure **Open SSH** - instructions [here]().

9. Set [PowerShell as default over SSH](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration#configuring-the-default-shell-for-openssh-in-windows):

	```
	New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Program Files\PowerShell\7\pwsh.exe" -PropertyType String -Force
	```


### [Script Execution Policy](https://www.youtube.com/watch?v=zW69MisrsWk)

**Disable Windows PowerShell 2.0**

1. Open the Start menu and search for _"Turn Windows features on or off"_
2. Find _Windows PowerShell 2.0_
3. Uncheck the box next to it
4. Click _OK_.


**Set Windows PowerShell Execution Policy**

You need to change *Computer Configuration* and *User configuration* policies:

1. Open _Group Policy Editor_
2. Navigate to _Administrative Templates > Windows Components > Windows PowerShell > Turn on Script Execution_
3. Set it to _Enabled_ and the _Execution Policy_ to _Allow local scripts and remote signed scripts_.


**Set PowerShell 7 Execution Policy**

You need to change *Computer Configuration* and *User configuration* policies:

0. Check for PowerShell 7 location (in this case _C:\Program Files\PowerShell\7_):

	```
	$PSHOME
	```

1. Navigate to that location
2. Make sure the `InstallPSCorePolicyDefinitions.ps1` file exists
3. Run the following commands:

	```
	cd "C:\Program Files\PowerShell\7"
	.\InstallPSCorePolicyDefinitions.ps1
	```

4. Open _Group Policy Editor_
5. Navigate to _Administrative Templates > PowerShell Core > Turn on Script Execution_
6. Set it to _Enabled_, Check _Use Windows PowerShell Policy setting_ checkbox, and set the _Execution Policy_ to _Allow local scripts and remote signed scripts_.


**Check Execution Policy Status**

```
Get-ExecutionPolicy -List
```

### [1Password SSH Agent](https://developer.1password.com/docs/ssh/get-started/)

1. **Turn On the 1Password SSH Agent**

	1. Open **1Password**
	2. Go to _Settings > Developer_
	3. Check _Use the SSH agent_.

	To make sure the SSH agent keeps running, even when the 1Password app is closed:
	1. Go to _Settings > General_
	2. Check _Keep 1Password in the notification area_.


2. **Disable OpenSSH Authentication Agent Service**

	1. Open **Services**
	2. Find the _OpenSSH Authentication Agent_ on the list
	3. Change _Startup type_ to _Disabled_
	4. Click OK
	5. Restart the computer.


3. **Configure Your SSH or Git Client**

	To use the SSH agent with Git, configure the core.sshCommand variable in your Git config to use Microsoft OpenSSH:

	```
	git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
	```
