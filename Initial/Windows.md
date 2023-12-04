## Windows Reset

1. Win+R > `ms-settings:recovery` > [**Reset this PC**](https://support.microsoft.com/en-us/windows/give-your-pc-a-fresh-start-0ef73740-b927-549b-b7c9-e6f2b48d275e)

2. Options:

	* Step 1: _Remove everything_
	* Step 2: _Cloud download_
	* Step 3: _Change settings_ > Make sure "_Delete files from all my devices_" is set to **NO!**


## Windows Install

[**Bypass Microsoft Account Requirement in Windows 11:**](https://hwbusters.com/quick-tips/quick-tips-6-bypass-microsoft-account-in-windows-11-the-hard-way/)

1. Physically disconnect network cable from computer.

2. Follow the installer until it asks to connect to Wifi

3. Bring up the Command Prompt _(Shift+F10)_

4. Enter the following and hit _Enter_:

		OOBE\BYPASSNRO

5. Sign in to Microsoft account after the installation completes.


## Apps

1. Install Windows Updates

2. Install [`winget`](https://github.com/microsoft/winget-cli) _**(already installed on W11 22H2)**_:

	1. User Account Control must be turned _ON_
	2. Download [`winget-cli`](https://github.com/microsoft/winget-cli/releases/) (\*.msixbundle)
	3. Run PowerShell as Admin
	4. Execute: `add-appxpackage "\PATH\TO\DOWNLOADED\FILE"`

3. Install [`choco`](https://chocolatey.org/install)

		Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

4. Install `winget` packages from [**export**](https://www.dropbox.com/sh/b00ss7490cw85el/AADWWWtufV2_Gd9xLIOrN9OYa?dl=0):

		winget import -i "\PATH\TO\DOWNLOADED\EXPORT.json"

5. Install `choco` packages from [**export**](https://www.dropbox.com/sh/nnnxiqfkyn2k1ye/AAAkW8zn-hPDizY1nedZAWQra?dl=0):

		choco install -y "\PATH\TO\DOWNLOADED\EXPORT.config"

6. Install the rest manually.
	

## Tweaks

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

5. Apply tweaks from `Tweaks` folder.


## Shell

0. _Assumption: [**Windows Terminal**](https://github.com/microsoft/terminal), [**PowerShell 7**](https://github.com/PowerShell/PowerShell), [**winget**](https://github.com/microsoft/winget-cli) are already installed (through steps above or otherwise)._

1. Install [**Oh My Posh**](https://ohmyposh.dev/docs/installation/windows):

		winget install JanDeDobbeleer.OhMyPosh -s winget

2. Install [**Nerd Fonts**](https://www.nerdfonts.com/)

	1. Run the [**`oh-my-posh installer`**](https://ohmyposh.dev/docs/installation/fonts):

			oh-my-posh font install

	2. Install `Meslo`.

	3. Restart Terminal.

	4. Terminal > Settings (Ctrl + ,) > Profiles > Defaults > Apperance > Font Face > `MesloLGSDZ NF`.

	5. _ALTERNATIVE: Install [**`MesloLGS NF Regular.ttf`**](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf) manually._

3. Install [**Modules**](https://www.powershellgallery.com/):

		Install-Module -Name PSReadLine -RequiredVersion 2.2.2
		Install-Module -Name Terminal-Icons

4. Edit `$profile`:

		notepad $profile

5. Restore [**PowerShell**](https://github.com/PowerShell/PowerShell) Profiles from backup:

		C:\Users\USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
		C:\Users\USERNAME\Documents\PowerShell\Microsoft.VSCode_profile.ps1

6. Restore [**Windows Terminal**](https://github.com/microsoft/terminal) Settings:

		C:\Users\USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json