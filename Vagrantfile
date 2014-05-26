VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.network "private_network", ip: "192.168.33.15"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "dev-box"
    vb.cpus = 4
    vb.memory = 4096
  end
end
