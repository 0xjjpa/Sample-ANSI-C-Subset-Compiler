# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  
  config.vm.box = "debian6_amd64"
  config.vm.host_name = "debian"
  config.vm.box_url = "http://goo.gl/2H6Fo"
  
  config.vm.network :hostonly, "10.10.10.10", :adapter=>4
  config.vm.customize ["modifyvm", :id, "--memory", "768"]
  
  #Port forward to allow testing with Host IP
  config.vm.forward_port 3000, 3000
  
  #Fix Symlinks in Virtualbox Shared Folders
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  #For extra speed, you can use NSF
  # config.vm.boot_mode = :gui

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "provision/puppet/manifests"
     puppet.manifest_file  = "base.pp"
  end

end
