# -*- mode: ruby -*-
# vi: set ft=ruby :

#exportando variaveis de ambiente do proxy
system "export http_proxy='http://proxy0.celepar.parana:8080/'"
system "export https_proxy='https://proxy0.celepar.parana:8080/'"
system "export no_proxy='localhost,127.0.0.1/8,10.0.0.0/8,192.168.1.0/24,.parana,.local'"

#system "wget -qN http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/frameworkphp/install.sh"
#system "wget -qN http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/frameworkphp/bootstrap.sh"

# instalacao automatica de plugins necessarios para o lightphp-vagrant
#required_plugins = %w( vagrant-vbguest )
#required_plugins.each do |plugin|
#  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
#end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "sles"

  config.vm.box_url = "http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/Vagrant/vagrant64-4g-xdebug-proxy.box"

  config.vm.define :sles do |sles|
    sles.vm.box = "sles"
    #sles.vm.network "forwarded_port", guest: 80, host: 8080 # accessing "localhost:8080" will access port 80 on the guest machine.
    #sles.vm.network :private_network, ip: "192.168.33.10"
  end
  
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "./", "/vagrant", disabled: true

  ## Altere o diretório abaixo ~/src abaixo pelo local onde armazenará seus projetos, p.ex. ~/workspace/
  config.vm.synced_folder "~/src", "/srv/www/", #type: "nfs"
    id: "vagrant-root",
    owner: "vagrant",
    group: "www",
    mount_options: ["dmode=775,fmode=775"]

  config.vm.provision "shell", path: "install.sh", privileged: true
  config.vm.provision "shell", path: "bootstrap.sh", run: "always", privileged: true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = 2048
    vb.cpus = 2
  end

end

