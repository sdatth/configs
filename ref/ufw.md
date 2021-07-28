# ufw

### - conf file at /etc/default/ufw
### - need root privileges to execute the commands

<br>

## **_commands_**
```bash
# checks status
ufw status 
ufw status numbered|verbose

# resets the firewall 
ufw reset 

# enable|disbale service
ufw enable|disable

# default config 
ufw default deny incoming
ufw default allow outgoing

# enable|disbale service using systemctl
systemctl status|start|stop|enable|disable ufw

# allowing|denying using protocal name
ufw allow|deny ssh
ufw allow|deny https

# allowing|denying a using port numbers
ufw allow 66/tcp
ufw deny 66/udp

# allowing|denying a specific ip addr or network
ufw allow|deny from 10.1.1.0/24
ufw allow|deny from 10.1.1.10
ufw allow|deny from 10.1.1.12 to any port 22 proto tcp|udp

# deleting an entry
ufw status numbered
ufw delete [number]

# allowing|denying on a specific interface
ufw allow in on eth0 from 203.0.113.100 to any port 456 proto tcp
ufw deny out on eth0 port 456 proto udp 

# limiting number of connections
# by default, the connection will be blocked after six attempts in a 30-second period.
ufw limit 80/tcp

```

<br>


