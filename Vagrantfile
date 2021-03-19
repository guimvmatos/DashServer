Vagrant.configure("2") do |config|
    # Node DASH SERVER configuration
    config.vm.define "dashServer" do |ds|
        ds.vm.box = "ubuntu/xenial64"
        ds.vm.hostname = "dashServer"
        #todo: definir ip, mac e bridge abaixo
        ds.vm.network "public_network", ip: "fc00::10"'''definir''',mac: "00154d000000"'''definir''', bridge: "vf0_0"'''definir'''
        ds.vm.provider "virtualbox" do |virtualbox|
            v.memory = 2048
            v.cpus = 2
            virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
			virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
        end
        ds.vm.provision "ansible" do |ansible| 
            #todo: trocar ip e definir no arquivo: nginx.conf em 3 posições devidamente marcada com 'todo'
            #todo: trocar ip e mac referente à vm client vlc no arquivo yml.
            ansible.playbook = "host-setup/dashServer/dashServer-playbook.yml"
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

    config.vm.define "clientVlc1" do |vlc|
    # Node DASH SERVER configuration
        vlc.vm.box = "leandrocdealmeida/ubuntu-vlc"
        vlc.vm.hostname = "clientVlc"
        #todo: definir ip, mac e bridge abaixo
        vlc.vm.network "public_network", ip: "fc00::10"'''definir''',mac: "00154d000000"'''definir''', bridge: "vf0_0"'''definir'''
        vlc.vm.provider "virtualbox" do |virtualbox|
            v.memory = 2048
            v.cpus = 2
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "19101"]
            virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
			virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
        end
        vlc.vm.provision "ansible" do |ansible| 
        #todo: trocar ip e mac referente à vm dash server no arquivo yml.
            ansible.playbook = "host-setup/clientVlc/clientVlc-playbook.yml"
        end
    end
end
