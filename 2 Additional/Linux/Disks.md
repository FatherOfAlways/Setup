**Replace *ALL_CAPS* text with appropriate values below.**

## Useful Commands

Volume usage data:

```
df -h
```

List block devices (physical disks):

```
lsblk
```

Info about storage devices:

```
sudo fdisk -l
```

Lists all mounted volumes or specific volumes:

```
mount - lists all mounted volumes
mount | grep DEVICE_NAME
```



## Troubleshooting

- [Ubuntu - Wrong Partition Size](https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning)



## Initialize Disk

1. Check if any volumes are mounted (if not, skip to step 3):

	```
	lsblk
	```

2. Unmount mounted volumes:

	```
	sudo umount /dev/VOLUME_NAME
	```

	Example volume name: `sdb1`

3. Run the fdisk command:

	```
	sudo fdisk /dev/DISK_NAME
	```

4. Create a new GUID (GPT) partition table:

	```
	g
	```

5. Create a new partition:

	```
	n
	```

	`Partition number (1-128, default 1)`: ***Press `Enter`***  
	`First sector (2048-60565982, default 2048)`: ***Press `Enter`***  
	`Last sector, +/-sectors or +/-sizefk,M,g,T,P} (2048-60565982, default 60565982)`: ***Press `Enter`***  

6. If the disk already has an existing partition table, remove it.

7. Write the changes to disk:

	```
	w
	```

8. Install `exFAT` packages ([`exfat-utils` and `exfat-fuse` are deprecated](https://askubuntu.com/questions/1403900/how-to-install-exfat-utils-and-hddtemp-on-ubuntu-22-04)):

	```
	sudo apt install exfatprogs
	```

9. Format the new partition:

	```
	sudo mkfs.exfat -n "USER_LABEL" /dev/VOLUME_NAME
	```

10. Mount the new volume:

	```
	sudo mkdir /mnt/USER_LABEL
	sudo mount /dev/VOLUME_NAME /mnt/USER_LABEL/
	```



## Mount Volume on Startup (`FSTAB`)

1. Get UUIDs for volumes on your machine:

	```
	sudo blkid
	```

2. Unmount volume (if mounted):

	```
	sudo umount /mnt/USER_LABEL
	```

3. Check if unmounted:

	```
	mount | grep DISK_NAME
	```

4. Open the `fstab` file:

	```
	sudo nano /etc/fstab
	```

5. Add the following line at the end:

	```
	UUID=67CF-3C04 /mnt/titan exfat defaults,umask=0000,uid=1000,gid=1000 0 1
	```

	Added `umask=0000,uid=1000,gid=1000` because exFAT drives do not support file ownership (helpful comments [here](https://superuser.com/questions/1720216/chown-operation-not-permitted-even-as-root-user) and [here](https://askubuntu.com/questions/113733/how-to-mount-a-ntfs-partition-in-etc-fstab)).

6. Basic test (mounts everything in `fstab` that isn't already mounted):

	```
	sudo mount -a
	```

7. Check if your volume was mounted:

	```
	mount | grep DISK_NAME
	```



## Resources

- [How do I check where devices are mounted?](https://askubuntu.com/questions/583909/how-do-i-check-where-devices-are-mounted)
- [Linux Crash Course - Formatting & Mounting Storage Volumes](https://www.youtube.com/watch?v=2Z6ouBYfZr8)
- [Linux Crash Course - The /etc/fstab file](https://www.youtube.com/watch?v=A7xH74o6kY0)