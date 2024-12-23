## macOS Installer

Source: [How to Download Full MacOS Installers from Command Line](https://osxdaily.com/2020/04/13/how-download-full-macos-installer-terminal/)

1. Launch the Terminal application as usual, then use the following command syntax, replacing `**.**.*` with the installer version you wish to download:

	```
	softwareupdate --fetch-full-installer --full-installer-version **.**.*
	```

2. Hit return to start downloading the full installer application of that version of MacOS

	Remember to replace `**.**.*` with the version you want to download, for example to download the full macOS Catalina installer the syntax would be:

	```
	softwareupdate --fetch-full-installer --full-installer-version 10.15
	```

	The downloaded installer application of MacOS will appear in the /Applications directory of MacOS, just as if you had downloaded the installer from the Mac App Store or Software Update control panel.


## USB

1. Connect the USB flash drive to the Mac, then rename the USB drive to `BootInstall` – you can pick a different name, just be sure to edit the command syntax to reflect that.

2. Open “Terminal”, found within `/Applications/Utilities/`

3. Place the following command syntax into the Terminal:

	```
	sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/BootInstall --applicationpath /Applications/Install\ macOS\ Sierra.app --nointeraction &&say Done
	```

4. Double-check to confirm the syntax is accurate, and remember the USB drive is going to be erased in this process, then hit the Return key to start creating the macOS Sierra USB installer media

5. Enter the admin password into the terminal if requested

6. Let the process run it’s course, this will take a while depending on the speed of the target flash volume but you can expect to wait nearly 30 minutes

7. When you see “Done” on screen, the task is complete and you can quit out of Terminal