VAGRANTFILE_API_VERSION = "2"
NAMED_NETWORK = 'en0: Wi-Fi (AirPort)'

def machines
  [ 
    { name: 'todo-db',  addr: '192.168.33.12', cpus: 1, mem: 1048 },
    { name: 'todo-app', addr: '192.168.33.11', cpus: 2, mem: 2048 },
    { name: 'todo-web', addr: '192.168.33.10', cpus: 2, mem: 1048 } 
  ]
end


Vagrant.configure(VAGRANTFILE_API_VERSION) do |configure|
  configure.vm.network :public_network, bridge: NAMED_NETWORK
#  configure.ssh.forward_agent = true

  machines.each do |machine|
    configure.vm.define machine[:name] do |individual_config|
      individual_config.vm.box = "ubuntu/trusty64"
      individual_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
      individual_config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.cpus = machine[:cpus]
        vb.memory = machine[:mem]
        vb.name = machine[:name]
      end
      individual_config.vm.network :private_network, ip: machine[:addr]
    end
  end

  configure.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'site.yml'
    ansible.inventory_path = 'hosts'
    #ansible.verbose = 'vvvv'
    ansible.groups = {
        'webservers' => ['todo-web'], 
        'appservers' => ['todo-app'],
        'dbservers'  => ['todo-db']
      }
  end
end
