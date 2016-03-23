Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.post_up_message = "Please see the instructions at https://github.com/rkawula/mills-computer-club."

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.add_recipe "mcc-stack"
      chef.add_recipe 'ruby_build'
      chef.add_recipe 'ruby_rbenv::system'
      chef.add_recipe 'nodejs'
      
      chef.json = {
        rbenv: {
          rubies: ['2.2.1'],
          global: '2.2.1',
          gems: {
            '2.2.1' => [{
              name: 'bundler',
            }]
          }
        }
      }

  end

end
