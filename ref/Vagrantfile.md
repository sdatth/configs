# Vagrant

### for more help visit [https://www.vagrantup.com/docs/cli]("https://www.vagrantup.com/docs/cli")

<br>

## core commands 
```bash
# power on the vm , it even creates the vm if not found
vagrant up   

# ssh into the vm                   
vagrant ssh  

# power off the vm                   
vagrant halt

# check the status of all the powered off and currently running vm's
vagrant global-status           

# destroy the vm 
vagrant destroy

# destroy the vm using id 
vagrant destroy [id]       

# reload the instance when there is a change in the configuration
vagrant reload 

# update the box to the latest version
vagrant box update 

# see the locally available boxes 
vagrant box list                

# remove box
vagrant box remove [box-name] --provider [provider]
vagrant box remove generic/centos8 --provider libvirt  #example

# check for outdated box globally 
vagrant box outdated --global   

# check which boxes will be deleted when prune is run
vagrant box prune --dry-run    

# delete outdated boxes
vagrant box prune             
```

<br>

## snapshot commands
```bash
# to create a snapshot
vagrant snapshot save [vm-name] snap-name  

# restore a snapshot 
vagrant snapshot restore [vm-name] snap-anme

# delete a snapshot
vagrant snapshot delete [vm-name] snap-name   

# see saved snapshots
vagrant snapshot list                          
```

<br>

## configuration

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

<br>
