# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04-x64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "chef-env-test"

  config.vm.provision :chef_solo do |chef|
    #chef.log_level = 'debug'
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.environments_path = "environments"
    chef.environment = "personal"
    chef.add_role "test"
  end
end
