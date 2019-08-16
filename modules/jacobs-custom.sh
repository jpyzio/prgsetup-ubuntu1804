#!/usr/bin/env bash

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

### BEGIN ALIASES
echo "alias wanip='curl -s http://whatismyip.akamai.com/'" >>~/.bashrc >>~/.zshrc
### END ALIASES

### BEGIN PACKAGES
sudo apt install --yes shellcheck speedtest-cli
### END PACKAGES
