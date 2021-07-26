# scp
## **_commands_**
### transferring single file from local to remote host
```scp /home/stacy/images/image*.jpg stacy@myhost.com:/home/stacy/archive```

<br> 

### transferring single file from remote to local host
```scp stacy@myhost.com:/home/stacy/archive/image*.jpg /home/stacy/downloads```

<br> 

### transferring directoy from local to remote host
```scp -r /home/jeff/downloads/documents jeff@myhost.com:/home/jeff/documents```

<br> 

### transferring directoy from remote to local host
```scp -r jeff@myhost.com:/home/jeff/documents /home/jeff/downloads/documents```

<br> 

### transferring from one remote to other remote host
```scp jeff@firsthost.com:/files/file1.zip brad@secondhost.com:/archives```
