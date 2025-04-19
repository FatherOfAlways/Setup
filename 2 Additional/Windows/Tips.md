## How to Access the Windows Startup Folder

All Users:

```
Shell:common startup
```

`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

Current User:

```
Shell:startup
```

`C:\Users\[User Name]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`



## Windows Native Apps

[Location](https://www.windows10forums.com/threads/setting-native-windows-10-apps-to-open-on-startup.16709/):

```
shell:AppsFolder
```



## Get Motherboard Info

[Command](http://www.howtogeek.com/208420/how-to-check-your-motherboard-model-number-on-your-windows-pc/):

```
wmic baseboard get product,Manufacturer,version,serialnumber
```



## Dark Mode

- [CopyQ](https://github.com/dracula/copyq/tree/380ed73ea1290da5f7eee3e17aa2c5399b466c2d)



## System Commands (CLI)

Comnmand: [**`shutdown`**](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/shutdown)

- Hibernate: `shutdown /h`
- Restart: `shutdown -r`



## Delete Hidden Mac Files

1. Open Command Prompt *(**NOT** PowerShell)*

2. Navigate to the folder you want to clean *(To navigate to a different drive, do it like this: "X:")*

3. Run the following:

	```
	del /s /q /f /a:h .DS_Store
	del /s /q /f /a:h ._*
	```


## Resources

- Windows Doesn’t Suck! Microsoft Just Wants You To Think So… - https://www.youtube.com/watch?v=4GASGO0go5I
- Download These Handy Tools NOW! - https://www.youtube.com/watch?v=0EtgwIajVqs