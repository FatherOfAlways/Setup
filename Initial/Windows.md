<!DOCTYPE html>
<html>
	<head>
		<title>macOS</title>
		<link rel="stylesheet" type="text/css" href="https://tomaz.co/wp-content/uploads/css/style-navbar.css">
		<style>
			p {
				margin-bottom: 14px;
			}
			pre {
				padding: 14px;
				border-radius: 6px;
				display: flex;
				margin-bottom: 14px
			}
			li p {
				margin-left: 5px;
			}
			li > ul,
			li > ol {
				margin-bottom: 14px;
			}
			ol li ol,
			ol li ul {
				font-size: 90%;
			}
			code {
				padding: 3px 6px;
				font-size: 16px;
				background: #eeeeee;
				border-radius: 4px;
				margin: 0 4px;
				line-height: 24px;
				font-size: 90%;
			}
			code p {
				margin: 0;
				padding: 0;
			}
			.article li, ol {
				padding-left: 4px;
			}
			hr {
				margin-top: 1.7em;
				margin-bottom: 2.7em;
			}
		</style>
	</head>
	<body class="article">
		<h2 id="windows-reset">Windows Reset</h2>
		<ol>
			<li>
				<p>Win+R &gt; <code>ms-settings:recovery</code> &gt; <a href="https://support.microsoft.com/en-us/windows/give-your-pc-a-fresh-start-0ef73740-b927-549b-b7c9-e6f2b48d275e"><strong>Reset this PC</strong></a></p>
			</li>
			<li>
				<p>Options:</p>
				<ul>
					<li>Step 1: <em>Remove everything</em></li>
					<li>Step 2: <em>Cloud download</em></li>
					<li>Step 3: <em>Change settings</em> &gt; Make sure &quot;<em>Delete files from all my devices</em>&quot; is set to <strong>NO!</strong></li>
				</ul>
			</li>
		</ol>
		<hr>
		<h2 id="windows-install">Windows Install</h2>
		<p><a href="https://hwbusters.com/quick-tips/quick-tips-6-bypass-microsoft-account-in-windows-11-the-hard-way/"><strong>Bypass Microsoft Account Requirement in Windows 11:</strong></a></p>
		<ol>
			<li>
				<p>Physically disconnect network cable from computer.</p>
			</li>
			<li>
				<p>Follow the installer until it asks to connect to Wifi</p>
			</li>
			<li>
				<p>Bring up the Command Prompt <em>(Shift+F10)</em></p>
			</li>
			<li>
				<p>Enter the following and hit <em>Enter</em>:</p>
				<pre><code>OOBE\BYPASSNRO</code></pre>
			</li>
			<li>Sign in to Microsoft account after the installation completes.</li>
		</ol>
		<hr>
		<h2 id="apps">Apps</h2>
		<ol>
			<li>
				<p>Install Windows Updates</p>
			</li>
			<li>
				<p>Install <a href="https://github.com/microsoft/winget-cli"><code>winget</code></a> <em><strong>(already installed on W11 22H2)</strong></em>:</p>
				<ol>
					<li>User Account Control must be turned <em>ON</em></li>
					<li>Download <a href="https://github.com/microsoft/winget-cli/releases/"><code>winget-cli</code></a> (*.msixbundle)</li>
					<li>Run PowerShell as Admin</li>
					<li>Execute: <code>add-appxpackage &quot;\PATH\TO\DOWNLOADED\FILE&quot;</code></li>
				</ol>
			</li>
			<li>
				<p>Install <a href="https://chocolatey.org/install"><code>choco</code></a></p>
				<pre><code>Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))</code></pre>
			</li>
			<li>
				<p>Install <code>winget</code> packages from <a href="https://www.dropbox.com/sh/b00ss7490cw85el/AADWWWtufV2_Gd9xLIOrN9OYa?dl=0"><strong>export</strong></a>:</p>
				<pre><code>winget import -i &quot;\PATH\TO\DOWNLOADED\EXPORT.json&quot;</code></pre>
			</li>
			<li>
				<p>Install <code>choco</code> packages from <a href="https://www.dropbox.com/sh/nnnxiqfkyn2k1ye/AAAkW8zn-hPDizY1nedZAWQra?dl=0"><strong>export</strong></a>:</p>
				<pre><code>choco install -y &quot;\PATH\TO\DOWNLOADED\EXPORT.config&quot;</code></pre>
			</li>
			<li>
				<p>Install the rest manually.</p>
			</li>
		</ol>
		<hr>
		<h2 id="tweaks">Tweaks</h2>
		<ol>
			<li>
				<p>Set up <a href="https://www.resilio.com/"><strong>Resilio Sync</strong></a>:</p>
				<ol>
					<li><a href="https://help.resilio.com/hc/en-us/articles/205457815-Sync-Private-Identity-Linking-My-Devices"><strong>Link new device</strong></a> to Identity (as <strong>Disconnected!</strong>).</li>
					<li>Set up sync folders.</li>
					<li>Disable <a href="https://help.resilio.com/hc/en-us/articles/205458125-Folder-Preferences"><strong>&quot;Store deleted files in folder archive&quot;</strong></a>.</li>
				</ol>
			</li>
			<li>
				<p>Import &amp; apply <a href="https://winaero.com/winaero-tweaker/"><strong>WinAero Tweaker</strong></a> config &amp; <strong>restart computer</strong></p>
			</li>
			<li>
				<p>Restore <a href="https://github.com/microsoft/PowerToys"><strong>PowerToys</strong></a> config.</p>
			</li>
			<li>
				<p>Configure <a href="https://beebom.com/how-remove-language-switcher-windows-11-taskbar/"><strong>Language Bar Stuff</strong></a>, disable <a href="https://superuser.com/a/1428326"><strong>Keyboard Layout Hotkey</strong></a>:</p>
				<ol>
					<li>Win+R &gt; <code>ms-settings:keyboard</code> - <em>Make sure your primary language is the only one available, remove others</em></li>
					<li>Win+R &gt; <code>ms-settings:typing</code> &gt; Advanced keyboard settings &gt; Use the desktop language bar when it is available - <em>Must be checked</em></li>
					<li>Win+R &gt; <code>ms-settings:typing</code> &gt; Advanced keyboard settings &gt; Language bar options &gt; Language bar &gt; Hidden - <em>Must be selected</em></li>
					<li>Win+R &gt; <code>ms-settings:typing</code> &gt; Advanced keyboard settings &gt; Language bar options &gt; Advanced Key Settings - <em>Disable the hotkeys</em></li>
				</ol>
			</li>
			<li>
				<p>Apply tweaks from <code>Tweaks</code> folder.</p>
			</li>
		</ol>
		<hr>
		<h2 id="shell">Shell</h2>
		<ol start="0">
			<li>
				<p><em>Assumption: <a href="https://github.com/microsoft/terminal"><strong>Windows Terminal</strong></a>, <a href="https://github.com/PowerShell/PowerShell"><strong>PowerShell 7</strong></a>, <a href="https://github.com/microsoft/winget-cli"><strong>winget</strong></a> already installed (in steps above).</em></p>
			</li>
			<li>
				<p>Install <a href="https://ohmyposh.dev/docs/installation/windows"><strong>Oh My Posh</strong></a>:</p>
				<pre><code>winget install JanDeDobbeleer.OhMyPosh -s winget</code></pre>
			</li>
			<li>
				<p>Install <a href="https://www.nerdfonts.com/"><strong>Nerd Fonts</strong></a></p>
				<ol>
					<li>
						<p>Run the <a href="https://ohmyposh.dev/docs/installation/fonts"><strong><code>oh-my-posh installer</code></strong></a>:</p>
						<pre><code>oh-my-posh font install</code></pre>
					</li>
					<li>
						<p>Install <code>Meslo</code>.</p>
					</li>
					<li>
						<p>Restart Terminal.</p>
					</li>
					<li>
						<p>Terminal &gt; Settings (Ctrl + ,) &gt; Profiles &gt; Defaults &gt; Apperance &gt; Font Face &gt; <code>MesloLGSDZ NF</code>.</p>
					</li>
					<li>
						<p><em>ALTERNATIVE: Install <a href="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"><strong><code>MesloLGS NF Regular.ttf</code></strong></a> manually.</em></p>
					</li>
				</ol>
			</li>
			<li>
				<p>Install <a href="https://www.powershellgallery.com/"><strong>Modules</strong></a>:</p>
				<pre><code>Install-Module -Name PSReadLine -RequiredVersion 2.2.2
Install-Module -Name Terminal-Icons</code></pre>
			</li>
			<li>
				<p>Edit <code>$profile</code>:</p>
				<pre><code>notepad $profile</code></pre>
			</li>
			<li>
				<p>Restore <a href="https://github.com/PowerShell/PowerShell"><strong>PowerShell</strong></a> Profiles from backup:</p>
				<pre><code>C:\Users\USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
C:\Users\USERNAME\Documents\PowerShell\Microsoft.VSCode_profile.ps1</code></pre>
			</li>
			<li>
				<p>Restore <a href="https://github.com/microsoft/terminal"><strong>Windows Terminal</strong></a> Settings:</p>
				<pre><code>C:\Users\USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json</code></pre>
			</li>
		</ol>
	</body>
</html>