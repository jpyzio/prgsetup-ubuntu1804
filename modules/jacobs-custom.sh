#!/usr/bin/env bash

### BEGIN SWAP
echo "vm.swappiness = 10" | sudo tee --append /etc/sysctl.conf

sudo fallocate -l 1G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

echo '#/swapfile    swap    swap    defaults    0   0' | sudo tee --append /etc/fstab
### END SWAP


### BEGIN GUI
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
### END GUI
