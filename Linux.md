## CLI

1.  Update system:

	```bash
	sudo apt update
	sudo apt upgrade
	```

2.  Remove Message of the day:

	```bash
	touch ~/.hushlogin
	```

3.  Check current (if already `ZSH`, skip to step **6**):

	```bash
	echo $SHELL
	```

4.  Install [`ZSH`](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903):

	```
	sudo apt update && sudo apt upgrade -y && sudo apt install zsh
	```

5.  Append [ZSH's executable filepath to `/etc/shells`](https://www.jakewiesler.com/blog/zsh-as-default-shell#append-zshs-executable-filepath-to-etcshells):

	```bash
	command -v zsh | sudo tee -a /etc/shells
	```

6.  Change current user's default shell to `ZSH`:

	```bash
	sudo chsh -s $(which zsh) $USER
	```

7.  Close the current terminal session and start a new one.
	
8.  Check shell (should be `ZSH`):

	```bash
	echo $SHELL
	```

9.  Install [`homebrew`](https://brew.sh/):

	1. Install `homebrew`:

		```bash
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		```

	2. Install [build tools](https://docs.brew.sh/Homebrew-on-Linux#requirements):

		```bash
		sudo apt-get install build-essential procps curl file git
		```

10. Install [`Oh My Posh`](https://ohmyposh.dev/):

	```bash
	brew install jandedobbeleer/oh-my-posh/oh-my-posh
	```

11. Install Nerd font - `Meslo`:

	```bash
	oh-my-posh font install
	```

12. Download my `Oh My Posh` theme:

	```bash
	cd ~ && mkdir ~/.poshthemes && cd .poshthemes/ && wget 'https://raw.githubusercontent.com/FatherOfAlways/Setup/refs/heads/main/poshthemes/TheCollabShort-2.2.omp.json'
	```

	_(Check if the `wget` link above is still correct.)_

13. Install [`Oh My Zsh`](https://ohmyz.sh/):

	```bash
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	```

14.  Install the following `Oh My Zsh` plugins:

	 * [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

		```bash
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		```

     * [`zsh-history-substring-search`](https://github.com/zsh-users/zsh-history-substring-search#install)

		```bash
		git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
		```

     * [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

		```bash
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
		```

     * [`you-should-use`](https://github.com/MichaelAquilina/zsh-you-should-use#installation)

		```bash
		git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
		```

15. Edit `.zshrc`

	```bash
	sudo nano ~/.zshrc
	```

16. Reload your profile for the changes to take effect:

	```bash
	exec zsh
	```

17. Enable `nano` [syntax highlighting](https://gist.github.com/BlakeGardner/5587269):

	 1. Install `nano` and [`nanorc`](https://github.com/scopatz/nanorc) via package manager:

		```bash
		brew install nano nanorc
		```

	 2. Update your `nanorc` file:

		```bash
		echo 'include "'"$(brew --cellar nano)"'/*/share/nano/*.nanorc"' >> ~/.nanorc
		```

	 3. Close the current terminal session and start a new one.


## Sudo Tweaks

Add User to the sudo Group:

```bash
sudo usermod -aG sudo USERNAME
```

To ensure that the user has sudo privileges, run the `whoami` command:

```bash
sudo whoami
```

[Add User to the sudoers File](https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/) (creates a new file with the authorization rules in the `/etc/sudoers.d` folder):

```bash
echo "USERNAME  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/USERNAME
```
