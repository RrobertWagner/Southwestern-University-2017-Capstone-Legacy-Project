# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network :private_network, ip: "192.168.56.1"

  config.vm.provision "shell", path: "vagrant/setup.sh",
    privileged: false
  config.vm.provision "shell", path: "vagrant/start.sh",
    privileged: false, run: "always"
end
