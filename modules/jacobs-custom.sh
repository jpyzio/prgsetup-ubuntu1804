#!/usr/bin/env bash

### BEGIN SWAP
echo "vm.swappiness = 10" | sudo tee --append /etc/sysctl.conf

sudo fallocate -l 1G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

echo '#/swapfile    swap    swap    defaults    0   0' | sudo tee --append /etc/fstab
### END SWAP


### BEGIN DOCK
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 50
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode ADAPTIVE
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
### END DOCK
