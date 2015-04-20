Title: Hosting R and Shiny Server in Ubuntu VM  
Author: Antonio Rostaing  
Email: arostaing@outlook.com
Keywords: R, Shiny Server, Virtual Machine, virtualbox, vagrant, ubuntu

#Virtual Machine hosting R and Shiny Server  

If you need a VM with R and Shiny Server ready to use, just clone this repo and just execute 'vagrant up'. That's All!

## Tools

Oracle Virtual BOX:  
https://www.virtualbox.org/wiki/Downloads  

Vagrant:  
https://www.vagrantup.com/downloads.html

Git &Github:  
http://git-scm.com/download  
https://mac.github.com/  
https://windows.github.com/


## Installation

- Create a directory and navigate to it.  
- Clone repository
  ```shell
  git clone
  ```
- Download VM ubuntu/trusty64
  ```shell
  >vagrant box add ubuntu/trusty64
  ==> box: Loading metadata for box 'ubuntu/trusty64'
    box: URL: https://atlas.hashicorp.com/ubuntu/trusty64
==> box: Adding box 'ubuntu/trusty64' (v14.04) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions
/14.04/providers/virtualbox.box
    box: Progress: 100% (Rate: 1840k/s, Estimated time remaining: --:--:--)
==> box: Successfully added box 'ubuntu/trusty64' (v14.04) for 'virtualbox'!
  ```
- Successfully added box 'ubuntu/trusty64'?
  ```
  vagrant box list
  ubuntu/trusty64 (virtualbox, 14.04)
  ```


##Virtual machine management

https://docs.vagrantup.com/v2/

**Boot virtual machine**  
`vagrant up`

**Reload provision**  
`vagrant reload --provision`

**SSH Session**  
`vagrant ssh`

**Shutdown**
- `vagrant suspend`  
Will save the current running state of the machine and stop it. The main benefit of this method is that it is super fast, usually taking only 5 to 10 seconds to stop and start your work. The downside is that the virtual machine still eats up your disk space, and requires even more disk space to store all the state of the virtual machine RAM on disk.
- `vagrant halt`
Will gracefully shut down the guest operating system and power down the guest machine. You can use vagrant up when you're ready to boot it again. The benefit of this method is that it will cleanly shut down your machine, preserving the contents of disk, and allowing it to be cleanly started again. The downside is that it'll take some extra time to start from a cold boot, and the guest machine still consumes disk space.
- `vagrant destroy`
Will remove all traces of the guest machine from your system. It'll stop the guest machine, power it down, and remove all of the guest hard disks. Again, when you're ready to work again, just issue a vagrant up. The benefit of this is that no cruft is left on your machine. The disk space and RAM consumed by the guest machine is reclaimed and your host machine is left clean. The downside is that vagrant up to get working again will take some extra time since it has to reimport the machine and reprovision it.

##Shiny server configuration

http://rstudio.github.io/shiny-server/latest

**Forwarded ports**:
- Shiny APPs: http://127.0.0.1:3838  
- Shiny Admin Interface: http://127.0.0.1:4151

**Synced folders**:
Synced folders enable Vagrant to sync a folder on the host machine to the guest machine, allowing you to continue working on your project's files on your host machine, but use the resources in the guest machine to compile or run your project.

By default, Vagrant will share your project directory (the directory with the Vagrantfile) to /vagrant.
