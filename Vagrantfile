VAGRANTFILE_API_VERSION = "2"
NAMED_NETWORK = 'en0: Wi-Fi (AirPort)'

machines = [ 
    { :name => 'web', :addr => '192.168.33.10' }, 
    { :name => 'app', :addr => '192.168.33.11' },
    { :name => 'db', :addr => '192.168.33.12' } 
  ]


def setup_box(configure, name, addr)
  configure.vm.define name do |individual_config|
    individual_config.vm.provider "virtualbox" do |vb|
      vb.name = name
    end
    individual_config.vm.network :private_network, ip: addr
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |configure|
  configure.vm.box = "ubuntu/trusty64"
  configure.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = 2048
  end

  configure.vm.network :public_network, bridged: NAMED_NETWORK

  machines.each do |machine|
    setup_box configure, machine[:name], machine[:addr]
  end

  configure.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'site.yml'
    ansible.groups = {
        'webservers' => ['todo-web.lvh.me'], 
        'appservers' => ['todo-app.lvh.me'],
        'dbservers' => ['todo-db.lvh.me']
      }
  end
end
