sudo apt-get update

# Install openjdk 7
#sudo apt-get install -y openjdk-7-jdk

# Install openjdk 8
sudo apt-get install -y openjdk-8-jdk

# Install java 8
#sudo add-apt-repository ppa:webupd8team/java
  #sudo apt-get update
  #echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
  #sudo apt-get install -y oracle-java8-installer
#sudo apt-get install -y oracle-java8-set-default

# Install scala
sudo apt-get install -y scala

# Install docker 
sudo apt-get install -y docker.io

# Install pip
sudo apt-get install -y python-pip

# Install Cassandra-driver
pip install cassandra-driver

# Install sbt
  #echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  #sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
  #sudo apt-get update
  #sudo apt-get install -y sbt

# Install Lightbend activator
command -v /opt/activator-dist-1.3.10/bin/activator >/dev/null 2>&1 || { 
  echo >&2 "I require activator but it's not installed.  Installing."; 
  cd /opt;
  sudo wget  -–quiet https://downloads.typesafe.com/typesafe-activator/1.3.10/typesafe-activator-1.3.10.zip;
  sudo unzip -q typesafe-activator-1.3.10.zip;
  cd /opt/activator-dist-1.3.10/bin;
  #export PATH=$PATH:/opt/activator-dist-1.3.10/bin;
  sudo echo 'export PATH=$PATH:/opt/activator-dist-1.3.10/bin' > /etc/profile.d/lightbend.sh
  source ~/.bashrc;
  sudo chmod a+x activator;
  cd /opt/activator-dist-1.3.10;
  sudo chgrp -hR vagrant bin;
  sudo chmod 775 bin;
  ##./activator
}

# Install Idea Intellij
command -v idea >/dev/null 2>&1 || { 
  echo >&2 "I require intellij but it's not installed.  Installing.";
  sudo mkdir /opt/idea 
  sudo wget --quiet -O /opt/idea/ideaIC-2016.1.1.tar.gz http://download.jetbrains.com/idea/ideaIC-2016.1.1.tar.gz;
  cd /opt/idea
  sudo tar xfz /opt/idea/ideaIC-2016.1.1.tar.gz;
  # cd idea-IC-145.597.3/bin;
  # sudo ./idea.sh;
}