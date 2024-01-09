## Homebrew

1. Login to App Store & close the app.

2. Install [`Homebrew`](https://brew.sh/) manually:

		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	_OPTIONAL (If not already installed in the above comamnd): Install [**Command Line Tools**](https://docs.brew.sh/Installation) for Xcode:_

		xcode-select --install

3. Install [**Rosetta 2**](https://support.apple.com/en-us/HT211861):

		softwareupdate --install-rosetta --agree-to-license

4. Install [`Homebrew`](https://brew.sh/) packages apps from [`brewfile`](https://www.dropbox.com/sh/wljpxtuticvsyzu/AACAe58Dmzq5h5uCeRfgcGnUa?dl=0):

		brew bundle --file "/PATH/TO/FILE/"


## iTerm

1. Install [`iTerm:`](https://iterm2.com/)

		brew install iterm2

2. Restore the following file to `~/Library/Application Support/iTerm2/DynamicProfiles` from backup:

	* `iTermPersonalised.json`

3. Restore the following file to `~/Library/Preferences` from backup:

	* `com.googlecode.iterm2.plist`


## Shell

1. Remove Message of the day from Terminal:

		touch ~/.hushlogin

2. Install [`Oh My Posh`](https://ohmyposh.dev/):

		brew install gcc
		brew install jandedobbeleer/oh-my-posh/oh-my-posh

3. Install Nerd font - `Meslo`:

		oh-my-posh font install

	_(If that doesn't work, manually install [`MesloLGS NF Regular`.](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf) [](https://www.nerdfonts.com/))_

4. Install [`Oh My Zsh`](https://github.com/ohmyzsh/ohmyzsh):

		sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

5. (If applicable) Take ownership of the `.oh-my-zsh` folder:

		cd ~
		chown -R USERNAME:admin .oh-my-zsh

6. Navigate to `.oh-my-zsh/custom/plugins` lugins folder:

		cd /Users/USERNAME/.oh-my-zsh/custom/plugins

7. Install the following [`Oh My Zsh`](https://github.com/ohmyzsh/ohmyzsh) plugins:

	* [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)

			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	* [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)

			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	* [`zsh-history-substring-search`](https://github.com/zsh-users/zsh-history-substring-search)

			git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

	* [`you-should-use`](https://github.com/MichaelAquilina/zsh-you-should-use#installation)

			git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use

8. Install [`lsd`](https://github.com/Peltoche/lsd):

		brew install lsd

9. Install [`fzf`](https://github.com/junegunn/fzf):

		brew install fzf

10. Restore the following files/folders to `~/` from backup:

	* `.oh-my-zsh`
	* `.poshthemes`
	* `.fzf.zsh`
	* `.zsh_history`
	* `.zshrc`

	_(Some configuration files uploaded [here](https://github.com/FatherOfAlways/Setup/tree/main/Shell/zshrc).)_

11. Restore the following files/folders to `.config` from backup:

	* `lsd`

12. Enable [Touch ID for `sudo`](https://sixcolors.com/post/2023/08/in-macos-sonoma-touch-id-for-sudo-can-survive-updates/):

	1. Navigate to the authentication directory > copy template to system-readable file > open in text editor:

			cd /etc/pam.d
			sudo cp sudo_local.template sudo_local
			sudo nano sudo_local

	2. Uncomment row with `pam_tid.so` and save the changes (⌃X, ↩).

## System

An awesome collection of these commands can be found [here](https://git.herrbischoff.com/awesome-macos-command-line/about/).

* Allow Apps from Anywhere in Gatekeeper:

		sudo spctl --master-disable

* Change Dock Size:

		defaults write com.apple.dock tilesize -int 45 && killall -KILL Dock

* Lock the Dock Size:

		defaults write com.apple.Dock size-immutable -bool true && killall Dock

* Make `~/Library/` permanently visible:

		chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

* Enable 'Expanded Save Dialog' as Default:

		defaults write -g NSNavPanelExpandedStateForSaveMode -bool TRUE

* Disable Animations When Opening the Info Window:

		defaults write com.apple.finder DisableAllAnimations -bool true && killall Finder

* Disable the Default Long Press Action for Keys:

		defaults write -g ApplePressAndHoldEnabled -bool false

* Add a Small Dock Spacer:

		defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && killall Dock

* Always Show Window Proxy Icons:

		defaults write -g NSToolbarTitleViewRolloverDelay -float 0
		defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

* Expand Save Panel by Default

		defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
		defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

* Disable Homebrew Analytics:

		brew analytics off


## SSH

1. Restore the following file to `/private/etc/ssh` from backup:

	* `sshd_config`

2. Restore the following files to `~/.ssh` from backup:

	* `authorized_keys`
	* `config`
	* `known_hosts`

3. Restart `ssh` service:

		sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
		sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist


## Optional

* Enable [**Root**](https://www.maketecheasier.com/enable-root-user-mac/) User:

		dsenableroot -u USERNAME