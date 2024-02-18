#!/bin/bash
#


# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# using bionic version for debian buster
#echo "deb https://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

sudo apt update
sudo apt install virtualbox-6.0

# vagrant
debfile="vagrant_2.2.5_x86_64.deb"
wget https://releases.hashicorp.com/vagrant/2.2.5/$debfile
sudo apt install ./$debfile
rm $debfile
