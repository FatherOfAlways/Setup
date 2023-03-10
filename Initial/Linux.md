<!DOCTYPE html>
<html>
	<body class="article">
		<h2 id="cli">CLI</h2>
		<ol start="0">
			<li>
				<p>Check current (if already <code>ZSH</code>, skip to step <strong>6</strong>):</p>
				<pre><code>echo $SHELL</code></pre>
			</li>
			<li>
				<p>Install <a href="https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903"><code>ZSH</code></a></p>
				<pre><code>sudo apt update
sudo apt upgrade
sudo apt install zsh</code></pre>
			</li>
			<li>
				<p>Append <a href="https://www.jakewiesler.com/blog/zsh-as-default-shell#append-zshs-executable-filepath-to-etcshells">ZSH&#39;s executable filepath to <code>/etc/shells</code></a>:</p>
				<pre><code>command -v zsh | sudo tee -a /etc/shells</code></pre>
			</li>
			<li>
				<p>Change current user&#39;s default shell to <code>ZSH</code>:</p>
				<pre><code>sudo chsh -s $(which zsh) $USER</code></pre>
			</li>
			<li>
				<p>Close the current terminal session and start a new one.</p>
			</li>
			<li>
				<p>Check shell (should be <code>ZSH</code>):</p>
				<pre><code>echo $SHELL</code></pre>
			</li>
			<li>
				<p>Install <a href="https://ohmyposh.dev/"><code>Oh My Posh</code></a>:</p>
				<pre><code>sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh</code></pre>
				<p>OPTIONAL: Download <code>Oh My Posh</code> themes:</p>
				<pre><code>mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip</code></pre>
			</li>
			<li>
				<p>Install <a href="https://ohmyz.sh/"><code>Oh My Zsh</code></a>:</p>
				<pre><code>sh -c &quot;$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)&quot;</code></pre>
			</li>
			<li>
				<p>Install the following <code>Oh My Zsh</code> plugins:</p>
				<ul>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh"><code>zsh-autosuggestions</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions</code></pre>
					</li>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-history-substring-search#install"><code>zsh-history-substring-search</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-hist</code></pre>
					</li>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md"><code>zsh-syntax-highlighting</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting</code></pre>
					</li>
					<li>
						<p><a href="https://github.com/MichaelAquilina/zsh-you-should-use#installation"><code>you-should-use</code></a></p>
						<pre><code>git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use</code></pre>
					</li>
				</ul>
			</li>
			<li>
				<p>Edit <code>.zshrc</code></p>
				<pre><code>cd ~
nano .zshrc</code></pre>
			</li>
			<li>
				<p>Reload your profile for the changes to take effect:</p>
				<pre><code>exec zsh</code></pre>
			</li>
		</ol>
	</body>
</html>