VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |configure|
  configure.vm.box = "hashicorp/precise64"
  configure.vm.network "public_network"

  configure.vm.define "web" do |config|
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "web"
      vb.cpus = 2
      vb.memory = 2048
    end
    config.vm.network "private_network", ip: "192.168.33.10", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.provision :shell, :path => "nginx-bootstrap.sh"
  end

  configure.vm.define "db" do |config|
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "db"
      vb.cpus = 2
      vb.memory = 2048
    end
    config.vm.network "private_network", ip: "192.168.33.11", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.provision :shell, :path => "mongodb-bootstrap.sh"
  end

  configure.vm.define "app" do |config|
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "app"
      vb.cpus = 2
      vb.memory = 2048
    end
    config.vm.network "private_network", ip: "192.168.33.12", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.provision :shell, :path => "node-bootstrap.sh"
  end
end
