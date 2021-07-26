# Vagrant

### for more help visit [https://www.vagrantup.com/docs/cli]("https://www.vagrantup.com/docs/cli")

<br>

## **_core commands_** 

### power on the vm , it even creates the vm if not found
```vagrant up```   

<br>

### ssh into the vm                   
```vagrant ssh```  

<br>

### power off the vm                   
```vagrant halt```

<br>

### check the status of all the powered off and currently running vm's
```vagrant global-status```           

<br>

### destroy the vm 
```vagrant destroy```     

<br>

### destroy the vm using id 
```vagrant destroy [id]```       

<br>

### reload the instance when there is a change in the configuration
```vagrant reload``` 

<br>

### update the box to the latest version
```vagrant box update``` 

<br>

### see the locally available boxes 
```vagrant box list```                

<br>

### check for outdated box globally 
```vagrant box outdated --global```   

<br>

### check which boxes will be deleted when prune is run
```vagrant box prune --dry-run```    

<br>

### delete outdated boxes
```vagrant box prune```               

<br>

## **_snapshot commands_**
### to create a snapshot
```vagrant snapshot save [vm-name] snap-name```  

<br>

### restore a snapshot 
```vagrant snapshot restore [vm-name] snap-anme``` 

<br>

### delete a snapshot
```vagrant snapshot delete [vm-name] snap-name```   

<br>

### see saved snapshots
```vagrant snapshot list```                          

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

<br>
