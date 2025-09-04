## User Accounts

[List all local users](https://askubuntu.com/questions/410244/is-there-a-command-to-list-all-users-also-to-add-delete-modify-users-in-the) you can use:

```
cut -d: -f1 /etc/passwd
```

List all [groups a user is a member of](https://superuser.com/questions/167965/how-do-i-list-the-groups-that-a-unix-user-is-a-member-of):

```
groups USERNAME
```


Remove/delete a user:

```
sudo userdel USERNAME
```

Delete the home directory of the deleted user account:

```
sudo rm -r /home/USERNAME
```

[Remove a user froma a group](https://unix.stackexchange.com/questions/29570/how-do-i-remove-a-user-from-a-group):

```
sudo gpasswd --delete USERNAME GROUP
```

Remove/delete a group:

```
sudo groupdel GROUP
```



## Search


For a [folder](https://stackoverflow.com/questions/47887522/how-to-search-for-a-directory-from-the-terminal-in-ubuntu):

```
find /search/location -type d -name "FOLDER_NAME"
```

for a [file](https://askubuntu.com/questions/144698/find-a-file-by-name-using-command-line):

```
find /search/location -type f -name "FILE_NAME"
```

**Tip:** wildcards are supported.