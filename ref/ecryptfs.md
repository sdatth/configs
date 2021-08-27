# ecryptfs

### - ecryptfs-utils package is required 

<br>

## commands
```bash
# encrypt a folder
mount -t ecryptfs [source directory] [Destintaion directory] -o [options]

# example
sudo mount -t ecryptfs ~/Documents/Myfiles/ ~/Documents/Myfiles/ 

# verify 
mount | grep ecryptfs

# lock or unmount a folder
umount [mounted_directory]

# example
umount ~/Documents/Myfiles/

```

<br>


