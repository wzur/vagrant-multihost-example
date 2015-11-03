# Example Vagrant multi-host project with Ansible

Host are provisioned with [Ansible](http://docs.ansible.com).

Virtual machine are created either with [VirtualBox](https://www.virtualbox.org/)
or with [QEMU](http://www.qemu.org). Please see `rebuild-all` script for that. That script uses QEMU.

Please see [Vagrant documentation](http://docs.vagrantup.com) for details how to use it. The quick tutorial is as follows:
* `vagrant up` - starts all virtual machines, provision them if necessary
* `vagrant provision` - provision already created virtual machines again - in this case it would be Ansible playbook in `provisioning/site.yml`
* `vagrant halt` - stop all created virtual machines

After Vagrant installs machines the first time it will spin up much faster the next time.

Once the virtual machines are up, you connect to with `vagrant ssh ex01`, etc, command.

Once the system is fully started, you connect to with:
* `http://ex01.multihostexample.dev`
* `http://ex02.multihostexample.dev`
* `http://ex03.multihostexample.dev`
* `http://ex04.multihostexample.dev`

## Requirements ##
* VirtualBox >= 4.3.26 or QEMU, ideally with KVM
* Ansible >= 1.9.0
* Vagrant >= 1.7.0

### VirtualBox ###

Virtualbox binaries are available at its [download page](https://www.virtualbox.org/wiki/Downloads) and follow the instruction there.

### QEMU ###

QEMU is available as Linux packages in the modern distributions.
Vagrant needs [Vagrant Libvirt Provider](https://github.com/pradels/vagrant-libvirt) - this can be installed with `vagrant plugin install vagrant-libvirt`

### Ansible ###

Please follow [installation instructions](http://docs.ansible.com/ansible/intro_installation.html) in the Ansible [documentation](http://docs.ansible.com).

Please note: as there isn't Ansible implementation for MS Windows, this example won't start Ansible provisioner on that platform.

### Vagrant ###

> Installing Vagrant is extremely easy. Head over to the [downloads page](http://www.vagrantup.com/downloads) and get the appropriate installer or package for your platform. Then install it using standard procedures for your operating system.

> The installer will automatically add vagrant to your system path so that it is available in terminals. If it is not found, please try logging out and logging back in to your system (this is particularly necessary sometimes for Windows).

taken from https://docs.vagrantup.com/v2/installation/index.html

############################
## Additional Vagrant Plugins Installation

### Install Vagrant Hostmanager Plugin
  * `vagrant plugin install vagrant-hostmanager`

## Deployment to Vagrant ##
```
#!shell

vagrant up
```

## Running Ansible playbooks again ##
```
#!shell

ansible-galaxy install -r requirements.yml
vagrant provision
```

## Running arbitrary Ansible playbooks ##
```
#!shell

./run-ansible-vagrant.sh provisioning/site.yml
```
