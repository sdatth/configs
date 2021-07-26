# Ansible
## test conncetion
```ansible all -m ping```

<br>

## test particular hosts conncetion
```ansible nodes -m ping```

<br>

## execute particular command 
```ansible nodes -m shell -a "lsb_release -a"```

<br>

## execute a playbook {-K flag is used to input superuser password}
```ansible-playbook installpackages.yaml -K```
