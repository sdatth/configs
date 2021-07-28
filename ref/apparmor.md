# Apparmor

## **_commands_**
```bash
# Checks status of the service and tells you if it is enabled on boot
systemctl status apparmor

# Starts the service
systemctl start apparmor

# Makes apparmor start on boot
systemctl enable apparmor 

# Checks which profiles have been enforced and related status
aa-status 

# creates a new profile
aa-genprof {example.sh}     

# to disable profile
sudo ln -s /etc/apparmor.d/{profile.name-here} /etc/apparmor.d/disable/
sudo apparmor_parser -R /etc/apparmor.d/{profile.name-here}

# to enable profile
sudo rm /etc/apparmor.d/disable/usr.sbin.mysqld
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.mysqld
```

<br>
