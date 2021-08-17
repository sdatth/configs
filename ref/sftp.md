# sftp

dependencies : ``sshfs``

## commands
```bash
# mount
sshfs -p 22 client@server1.net:/home/user/ /home/user/mnt/ -o follow_symlinks

# unmount
fusermount -u /home/user/mnt
```
