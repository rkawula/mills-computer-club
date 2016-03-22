Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.post_up_message = "Please see the instructions at https://github.com/rkawula/mills-computer-club."

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {}
    # Will finish provisioning later. Getting box to work first.
  end
end
