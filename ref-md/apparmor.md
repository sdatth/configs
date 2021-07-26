# Apparmor

### Checks status of the AppArmor service and tells you if it is enabled on boot
```systemctl status apparmor```

<br>

### Starts the service
```systemctl start apparmor```

<br>

### Makes apparmor start on boot
```systemctl enable apparmor```  

<br>

### Checks which profiles have been enforced and related status
```aa-status``` 

<br>

### creates a new profile
```aa-genprof {example.sh}```     

<br>

### to disable profile
```
sudo ln -s /etc/apparmor.d/{profile.name-here} /etc/apparmor.d/disable/
sudo apparmor_parser -R /etc/apparmor.d/{profile.name-name-here}
```

<br>

### to enable profile
```
sudo rm /etc/apparmor.d/disable/usr.sbin.mysqld
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.mysqld
```

<br>
