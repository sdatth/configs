# Vagrant

## **_core commands_** 
```
# vagrant up                      - to power on the vm , it even creates the vm if not found
# vagrant ssh                     - to ssh into the vm
# vagrant halt                    - to power off the vm
# vagrant global-status           - to check the status of all the powered off and currently running vm's
# vagrant destroy                 - to destroy the vm 
# vagrant destroy [id]            - to destroy the vm using id 
# vagrant reload                  - to reload the instance when there is a change in the configuration
# vagrant box update              - to update the box to the latest version
# vagrant box list                - to see the locally available boxes 
# vagrant box outdated --global   - to check for outdated box globally 
# vagrant box prune --dry-run     - to check which boxes will be deleted when the command is run without the --dry-run flag
# vagrant box prune               - to delete outdated boxes

## snapshot commands
# vagrant snapshot save [vm-name] snap-name      - to create a snapshot
# vagrant snapshot restore [vm-name] snap-anme   - to restore a snapshot 
# vagrant snapshot delete [vm-name] snap-name    - to delete a snapshot      
# vagrant snapshot list                          - to see saved snapshots

# for more help visit "https://www.vagrantup.com/docs/cli"
```

<br>

## **_configuration_**

```
Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-vm" do |vm1|
    vm1.vm.hostname = "ubuntu-vm"
    vm1.vm.box = "generic/ubuntu2004"
    vm1.vm.network "private_network", ip: "192.168.33.10"
    
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu-vm"
      vb.gui = false
      vb.memory = "2048"
    end

    vm1.vm.provision "shell", run: "always", inline: <<-SHELL
        echo "Hello from the Ubuntu VM"
    SHELL
  end

  config.vm.define "centos-vm" do |vm2|
    vm2.vm.hostname = "centos-vm"
    vm2.vm.box = "generic/centos7"
    vm2.vm.network "private_network", ip: "192.168.33.20"
    
    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "centos-vm"
      vb.gui = false
      vb.memory = "2048"
    end

    vm2.vm.provision "shell", run: "always", inline: <<-SHELL
        echo "Hello from the CentOS VM"
    SHELL
  end
  
end
```