# Ansible

## commands

```bash
# test connection
ansible all -m ping

# test particular hosts connection
ansible nodes -m ping

# execute particular command 
ansible nodes -m shell -a "lsb_release -a"
ansible nodes -a "lsb_release -a"

# execute a playbook {-K flag is used to input superuser password}
ansible-playbook installpackages.yaml -K

# vault commands
ansibe-vault {create,edit,view,encrypt,decrypt} file.yml

# use vault
ansible-playbook file.yml --ask-vault-pass -K
ansible-playbook file.yml --vault-passworld-file /path/to/pass-file -K

# oneline command
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <username> -i '${self.ipv4_address},' --private-key /path/to/file -e 'pub_key=/path/to/file' ansible_become_pass=<password> file.yml


```

<br>
