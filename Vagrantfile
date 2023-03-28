# -*- mode: ruby -*-
# vi: set ft=ruby :
# Example Multi-Box edited by Jessica Rankins 4/17/2017


  # All Vagrant configuration is done below. The "2" in Vagrant.configure
  # configures the configuration version.
Vagrant.configure("2") do |config|

  config.vm.synced_folder "./vagrant", "/home/vagrant", type: "virtualbox"
  config.vm.box = "bento/ubuntu-20.04"	

  # Configure the Web Server
  config.vm.define "Web" do |web|
    web.vm.provider :virtualbox do |vb|
      vb.name = "Web"
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--description", "WebBox is an apache VM used to demonstrate Infrastructure as code principles via Vagrant. It is also used to demonstrate defining multiple machines in a single Vagrantfile."]
    end

    # After vagrant up, should see VM's web page in browser at 192.168.3.5
    web.vm.network "private_network", ip: "192.168.3.5"
    web.vm.hostname = "Web"
    web.vm.provision :shell, path: "web_provision.sh"
  end


  # Configure the Database
  config.vm.define "DB" do |db|
    db.vm.provider :virtualbox do |vb|
      vb.name = "DB"
      vb.memory = 512
      vb.customize ["modifyvm", :id, "--description", "DBBox is a mysql VM used to demonstrate Infrastructure as code principles via Vagrant. It is also used to demonstrate defining multiple machines in a single Vagrantfile."]
    end

    db.vm.hostname = "DB"
    db.vm.provision :shell, path: "db_provision.sh"
	db.vm.provision :shell, path: "wp_provision.sh"
    db.vm.network "private_network", ip: "192.168.3.6"
  end
  
  # display this message at end of vagrant up
  config.vm.post_up_message = "VM´s inicializadas com sucesso!"
	
end    # End configuring