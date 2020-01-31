#!/usr/bin/env bash

### BEGIN VirtualBox
wget --quiet https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget --quiet https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib"

sudo apt update
sudo apt install --yes virtualbox virtualbox-ext-pack

sudo adduser $USER vboxusers
### END VirtualBox
