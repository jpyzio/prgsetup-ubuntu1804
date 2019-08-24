#!/usr/bin/env bash

### BEGIN Dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 50
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode ADAPTIVE
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
### END Dock

### BEGIN Aliases
echo "alias wanip='curl -s http://whatismyip.akamai.com/'" >>~/.bashrc >>~/.zshrc
### END Aliases

### BEGIN Packages
sudo apt install --yes shellcheck speedtest-cli
### END Packages

### BEGIN Enable performance mode
sudo apt install --yes cpufrequtils
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
### END Enable performance mode
