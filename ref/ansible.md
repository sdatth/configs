# Ansible

## **_commands_**

```bash
# test connection
ansible all -m ping

# test particular hosts connection
ansible nodes -m ping

# execute particular command 
ansible nodes -m shell -a "lsb_release -a"

# execute a playbook {-K flag is used to input superuser password}
ansible-playbook installpackages.yaml -K
```

<br>
