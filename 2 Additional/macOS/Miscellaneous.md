## Restart Options

If you're troubleshooting your Mac, you may want a more specific Restart process than OS X performs by default. Here are some of the most common restart options for fixing errors or otherwise cleaning up your Mac. To use them, when you restart normally, you'll also want to hold down one of the following key commands:

- **`Shift + Up Arrow`**: Restart in Safe Mode, which checks the disk and then loads without extensions, startup apps, and other non-essentials.
- **`Option`**: Restart into Startup Manager, which lets you choose which drive you want to boot from, should you have multiple drives available.
- **`C`**: Restart and boot from an optical or USB drive.
- **`D`**: Restart into Apple Hardware Test (pre-June 2013 Macs) or Apple Diagnostics (post-June 2013 Macs) mode, which can help determine any problems that might exist on your system.
- **`Option + D`**: Restart into the online versions of Apple Hardware Test or Apple Diagnostics mode
- **`N`**: Restart from a compatible NetBoot server.
- **`Option + N`**: Restart from a NetBoot server using the default image.
- **`Command + R`**: Restart into OS X Recovery utility, which lets you re-install, repair, or restore your Mac.
- **`Command + Option + R`**: Restart into the online OS X Recovery utility.
- **`Command + Option + R + P`**: Restart and reset NVRAM, which can help clear up speaker, screen resolution, or startup disk problems.
- **`Command + S`**: Restart in single-user mode for troubleshooting or development work.
- **`T`**: Restart in target disk mode, which lets you mount one Mac as a drive for another.
- **`X`**: Restart from an OS X startup volume.
- **`Command + V`**: Restart into verbose mode for troubleshooting or development work.



## Duplicating Folder Structure (Without Contents)

```
rsync -a /path/from/ /path/to/ --include \*/ --exclude \*
```

The	`--include \*/` specifies that all directories should be copied, and `--exclude \*` specifies that all files should be excluded from the copy.

The beauty of this is that the new directory hierarchy has the same attributes, timestamps, permissions, etc as the original.

Source: [Superuser](https://superuser.com/questions/171629/copy-directory-structure-without-copying-files-on-mac-os-x)



## Create Shell Script File

1. Make a file, save it with `.sh` extension.

2. Add `#!/bin/sh` on the first line. You could also specify a different shell.

3. Write/paste command(s) below the first line and save the file.

4. Run the following command on your file:

	```
	chmod 700 /path/to/file
	```

5. Done.



