## CLI

1.  Remove Message of the day:

	```
	touch ~/.hushlogin
	```

2.  Check current (if already `ZSH`, skip to step **6**):

	```
	echo $SHELL
	```

3.  Install [`ZSH`](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903):

	```
	sudo apt update && sudo apt upgrade -y && sudo apt install zsh
	```

4.  Append [ZSH's executable filepath to `/etc/shells`](https://www.jakewiesler.com/blog/zsh-as-default-shell#append-zshs-executable-filepath-to-etcshells):

	```
	command -v zsh | sudo tee -a /etc/shells
	```

5.  Change current user's default shell to `ZSH`:

	```
	sudo chsh -s $(which zsh) $USER
	```

6.  Close the current terminal session and start a new one.
	
7.  Check shell (should be `ZSH`):

	```
	echo $SHELL
	```

8.  Install [`Oh My Posh`](https://ohmyposh.dev/).

	NOTE: You have to select the correct architecture!

	1.  `arm` (ARM machine - e.g. Raspberry Pi):

		```
		sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-arm -O /usr/local/bin/oh-my-posh
		sudo chmod +x /usr/local/bin/oh-my-posh
		```

	2.  `amd64` (regular x86 machine):

		```
		sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
		sudo chmod +x /usr/local/bin/oh-my-posh
		```

9.  Install Nerd font - `Meslo`:

	```
	oh-my-posh font install
	```

10. Download [my `Oh My Posh` themes](https://github.com/FatherOfAlways/Setup/tree/main/Shell):

	```
	cd ~
	mkdir ~/.poshthemes
	cd .poshthemes/
	wget 'https://raw.githubusercontent.com/FatherOfAlways/Setup/refs/heads/main/3%20Config/Shell/poshthemes/TheCollabShort-2.2.omp.json'
	```

	_(Check if the `wget` link above is still correct.)_

11.  Install [`Oh My Zsh`](https://ohmyz.sh/):

		```
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		```

12.  Install the following `Oh My Zsh` plugins:

	 * [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

		```
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		```

     * [`zsh-history-substring-search`](https://github.com/zsh-users/zsh-history-substring-search#install)

		```
		git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
		```

     * [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

		```
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		```

     * [`you-should-use`](https://github.com/MichaelAquilina/zsh-you-should-use#installation)

		```
		git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
		```

13.  Edit `.zshrc`

		```
		sudo nano ~/.zshrc
		```

	 _(Configuration uploaded [here.](https://github.com/FatherOfAlways/Setup/blob/main/3%20Config/Shell/zshrc/.zshrc%20-%20Pi))_

14.  Reload your profile for the changes to take effect:

		```
		exec zsh
		```

15. Enable `nano` [syntax highlighting](https://gist.github.com/BlakeGardner/5587269):

	 1. Install `nano` and [`nanorc`](https://github.com/scopatz/nanorc) via package manager:

		```
		brew install nano nanorc
		```

	 2. Update your `nanorc` file:

		```
		echo 'include "'"$(brew --cellar nano)"'/*/share/nano/*.nanorc"' >> ~/.nanorc
		```

	 3. Close the current terminal session and start a new one.


## Tweaks

Add User to the sudo Group:

```
usermod -aG sudo USERNAME
```

To ensure that the user has sudo privileges, run the `whoami` command:

```
sudo whoami
```

[Add User to the sudoers File](https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/) (creates a new file with the authorization rules in the `/etc/sudoers.d` folder):

```
echo "USERNAME  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/USERNAME
```
