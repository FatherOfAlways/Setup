<!DOCTYPE html>
<html>
	<body class="article">
		<h2 id="homebrew">Homebrew</h2>
		<ol>
			<li>
				<p>Login to App Store &amp; close the app.</p>
			</li>
			<li>
				<p>Install <a href="https://brew.sh/"><code>Homebrew</code></a> manually:</p>
				<pre><code>ruby -e &quot;$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)&quot;</code></pre>
			</li>
			<li>
				<p>Install <a href="https://docs.brew.sh/Installation"><strong>Command Line Tools</strong></a> for Xcode:</p>
				<pre><code>xcode-select --install</code></pre>
			</li>
			<li>
				<p>Install <a href="https://support.apple.com/en-us/HT211861"><strong>Rosetta 2</strong></a>:</p>
				<pre><code>softwareupdate --install-rosetta --agree-to-license</code></pre>
			</li>
			<li>
				<p>Install <a href="https://brew.sh/"><code>Homebrew</code></a> packages apps from <a href="https://www.dropbox.com/sh/wljpxtuticvsyzu/AACAe58Dmzq5h5uCeRfgcGnUa?dl=0"><code>brewfile</code></a>:</p>
				<pre><code>brew bundle --file /PATH/TO/FILE</code></pre>
			</li>
		</ol>
		<h2 id="system">System</h2>
		<ul>
			<li>
				<p>Allow Apps from Anywhere in Gatekeeper:</p>
				<pre><code>sudo spctl --master-disable</code></pre>
			</li>
			<li>
				<p>Change Dock Size:</p>
				<pre><code>defaults write com.apple.dock tilesize -int 45 &amp;&amp; killall -KILL Dock</code></pre>
			</li>
			<li>
				<p>Lock the Dock Size:</p>
				<pre><code>defaults write com.apple.Dock size-immutable -bool true && killall Dock</code></pre>
			</li>
			<li>
				<p>Make <code>~/Library/</code> permanently visible:</p>
				<pre><code>chflags nohidden ~/Library &amp;&amp; xattr -d com.apple.FinderInfo ~/Library</code></pre>
			</li>
			<li>
				<p>Enable &#39;Expanded Save Dialog&#39; as Default:</p>
				<pre><code>defaults write -g NSNavPanelExpandedStateForSaveMode -bool TRUE</code></pre>
			</li>
			<li>
				<p>Disable Animations When Opening the Info Window:</p>
				<pre><code>defaults write com.apple.finder DisableAllAnimations -bool true &amp;&amp; killall Finder</code></pre>
			</li>
			<li>
				<p>Disable the Default Long Press Action for Keys:  </p>
				<pre><code>defaults write -g ApplePressAndHoldEnabled -bool false</code></pre>
			</li>
			<li>
				<p>Add a Small Dock Spacer:</p>
				<pre><code>defaults write com.apple.dock persistent-apps -array-add &#39;{&quot;tile-type&quot;=&quot;small-spacer-tile&quot;;}&#39; &amp;&amp; killall Dock</code></pre>
			</li>
			<li>
				<p>Install SF Mono Font:</p>
				<pre><code>cd /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts
cp *.otf ~/Library/Fonts/</code></pre>
			</li>
			<li>
				<p>Always Show Window Proxy Icons:</p>
				<pre><code>defaults write -g NSToolbarTitleViewRolloverDelay -float 0</code></pre>
			</li>
		</ul>
		<h2 id="shell">Shell</h2>
		<ol>
			<li>
				<p>Remove Start text from Terminal:</p>
				<pre><code>touch ~/.hushlogin</pre></code>
			</li>
			<li>
				<p>Install <a href="https://ohmyposh.dev/"><code>Oh My Posh</code></a>::</p>
				<pre><code>brew install gcc
brew install jandedobbeleer/oh-my-posh/oh-my-posh</pre></code>
			</li>
			<li>
				<p>Install Nerd font - <code>Meslo</code>:</p>
				<pre><code>oh-my-posh font install</code></pre>
				<p><em>(If that doesn't work, manually install <a href="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"><code>MesloLGS NF Regular</code></a> <a href="https://www.nerdfonts.com/"><strong></strong></a>)</em></p>
			</li>
			<li>
				<p>Install <a href="https://github.com/ohmyzsh/ohmyzsh"><code>Oh My Zsh</code></a>:</p>
				<pre><code>sudo sh -c &quot;$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)&quot;</pre></code>
			</li>
			<li>
				<p>(If applicable) Take ownership of the <code>.oh-my-zsh</code> folder: </p>
				<pre><code>cd ~
chown -R USERNAME:admin .oh-my-zsh</pre></code>
			</li>
			<li>
				<p>Navigate to <code>.oh-my-zsh/custom/plugins</code> lugins folder:</p>
				<pre><code>cd /Users/USERNAME/.oh-my-zsh/custom/plugins</pre></code>
			</li>
			<li>
				<p>Install the following <a href="https://github.com/ohmyzsh/ohmyzsh"><code>Oh My Zsh</code></a> plugins:</p>
				<ul>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-autosuggestions"><code>zsh-autosuggestions</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions</pre></code>
					</li>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-syntax-highlighting"><code>zsh-syntax-highlighting</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting</pre></code>
					</li>
					<li>
						<p><a href="https://github.com/zsh-users/zsh-history-substring-search"><code>zsh-history-substring-search</code></a></p>
						<pre><code>git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search</pre></code>
					</li>
					<li>
						<p><a href="https://github.com/MichaelAquilina/zsh-you-should-use#installation"><code>you-should-use</code></a></p>
						<pre><code>git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use</pre></code>
					</li>
				</ul>
			</li>
			<li>
				<p>Install <a href="https://github.com/Peltoche/lsd"><code>lsd</code></a>:</p>
				<pre><code>brew install lsd</pre></code>
			</li>
			<li>
				<p>Install <a href="https://github.com/junegunn/fzf"><code>fzf</code></a>:</p>
				<pre><code>brew install fzf
$(brew --prefix)/opt/fzf/install</pre></code>
			</li>
			<li>
				<p>Restore the following files/folders to <code>~/</code> from backup:</p>
				<p>
					<ul>
						<li><code>.poshthemes</code></li>
						<li><code>.oh-my-zsh</code></li>
						<li><code>.fzf.zsh</code></li>
						<li><code>.zsh_history</code></li>
						<li><code>.zshrc</code></li>
					</ul>
					<em>(Some configuration files uploaded <a href="https://github.com/FatherOfAlways/Setup/tree/main/zshrc">here</a>.)</em>
				</p>
			</li>
			<li>
				<p>Restore the following files/folders to <code>.config</code> from backup:</p>
				<p>
					<ul>
						<li><code>lsd</code></li>
					</ul>
				</p>
			</li>
			<li>
				<p>Restore the <code>iTermPersonalised.json</code> Profile from backup to <a href="https://iterm2.com/"><strong>iTerm</strong></a> user folder:</p>
				<pre><code>~/Library/Application Support/iTerm2/DynamicProfiles</pre></code>
			</li>
		</ol>
		<h2 id="optional">Optional</h2>
		<ul>
			<li>
				<p>Enable <a href="https://www.maketecheasier.com/enable-root-user-mac/"><strong>Root</strong></a> User:</p>
				<pre><code><span class="hljs-attribute">dsenableroot -u USERNAME</span></code></pre>
			</li>
		</ul>
	</body>
</html>