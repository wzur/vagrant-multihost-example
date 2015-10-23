# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# The project name is base for directories, hostname and alike
project_name = "multihostexample"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "wzurowski/vivid32"

####    config.vm.network :forwarded_port, guest: 80, host: 8080

####    config.vm.synced_folder "./" + project_name , "/usr/share/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

    # Use hostonly network with a static IP Address and enable
    # hostmanager so we can have a custom domain for the server
    # by modifying the host machines hosts file
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    {
      'ex01'     => '172.22.22.101',
      'ex02'     => '172.22.22.102',
      'ex03'     => '172.22.22.103',
      'ex04'     => '172.22.22.104',
    }.each do |app_name, ip_address|
      config.vm.define app_name do |node|
          node.vm.hostname = app_name + "." + project_name + ".dev"
          node.vm.network :private_network, ip: ip_address
###          node.hostmanager.aliases = [ "beanstalk." + node.vm.hostname ]
      end
    end

    config.vm.provision :hostmanager
    config.vm.provision :ansible do |ansible|
      ansible.groups = {
        "group01" => ["ex01"],
        "group02" => ["ex02"],
        "group03" => ["ex03"],
        "group04" => ["ex04"],
        "all_groups:children" => ["group01", "group02", "group03", "group04"],
      }
      ansible.playbook = "./provisioning/site.yml"
    end
end
