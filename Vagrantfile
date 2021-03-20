Vagrant.configure("2") do |config|
    # Node DASH SERVER configuration
    config.vm.define "dashServer" do |ds|
        ds.vm.box = "srouting/srv6-net-prog"
        ds.vm.hostname = "ds"
        ds.vm.network "public_network", ip: "fc00::8",mac: "00154d000004", bridge: "vf0_4"
        ds.vm.provider "virtualbox" do |virtualbox|
            virtualbox.memory = 2048
            virtualbox.cpus = 2
            virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
			virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
        end
        ds.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/dashServer/dashServer-playbook.yml"
        ds.vm.provision "shell", path: "host-setup/dashServer/config_dashServer.sh"
        end
    end
    ''' Teóricamente, não precisarei desta vm pois utilizarei a netronome. Manterei por segurança.
    config.vm.define "bmv2" do |bmv2|
        bmv2.vm.box = "leandrocdealmeida/bmv2-p4"
        bmv2.vm.hostname = "bmv2"
        bmv2.vm.network "private_network", ip: "192.168.56.201",
            name: "vboxnet0"
        bmv2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "dash-S1"
        bmv2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S1-client"
        bmv2.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 4
            v.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
        end
        bmv2.vm.provision "ansible" do |ansible| 
            ansible.playbook = "switch-setup/bmv2/bmv2-playbook.yml"
        end
    end
    '''

    config.vm.define "clientVlc" do |vlc|
    # Node DASH SERVER configuration
        vlc.vm.box = "srouting/srv6-net-prog"
        vlc.vm.hostname = "vlc"
        vlc.vm.network "public_network", ip: "fc00::9",mac: "00154d000005", bridge: "vf0_5"
        vlc.vm.provider "virtualbox" do |virtualbox|
            virtualbox.memory = 2048
            virtualbox.cpus = 2
            virtualbox.customize ["modifyvm", :id, "--vrde", "on"]
            virtualbox.customize ["modifyvm", :id, "--vrdeport", "19101"]
            virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
			virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
        end
            vlc.vm.provision "shell", path: "host-setup/clientVlc/config_clientVlc.sh"
    end
end
