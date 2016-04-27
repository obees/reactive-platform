# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu_15_10_desktop"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    
    sudo apt-get update
    sudo apt-get install -y openjdk-8-jdk
    # sudo mkdir /opt/idea
    
    command -v idea >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; 
	sudo wget -O /opt/idea/ideaIC-2016.1.1.tar.gz http://download.jetbrains.com/idea/ideaIC-2016.1.1.tar.gz;
	sudo tar xfz /opt/idea/ideaIC-2016.1.1.tar.gz;
	cd idea-IC-145.597.3/bin;
	sudo ./idea.sh;
    }
    
    sudo apt-get install -y docker.io
    sudo apt-get install -y scala

    command -v /opt/activator-dist-1.3.9/bin/activator >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; 
    cd /opt;
	sudo wget https://downloads.typesafe.com/typesafe-activator/1.3.9/typesafe-activator-1.3.9.zip;
	sudo unzip typesafe-activator-1.3.9.zip;
	cd /opt/activator-dist-1.3.9/bin;
	#export PATH=$PATH:/opt/activator-dist-1.3.9/bin;
	sudo echo 'export PATH=$PATH:/opt/activator-dist-1.3.9/bin' > /etc/profile.d/lightbend.sh
	source ~/.bashrc;
	sudo chmod a+x activator;
	cd /opt/activator-dist-1.3.9;
	sudo chgrp -hR vagrant bin;
	sudo chmod 775 bin;
	##./activator
	}

	echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
	sudo apt-get update
	sudo apt-get install -y sbt
	
	SHELL
end
