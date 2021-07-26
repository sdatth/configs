# Ansible

## **_commands_**
### test connection
```ansible all -m ping```

<br>

### test particular hosts connection
```ansible nodes -m ping```

<br>

### execute particular command 
```ansible nodes -m shell -a "lsb_release -a"```

<br>

### execute a playbook {-K flag is used to input superuser password}
```ansible-playbook installpackages.yaml -K```

<br>
