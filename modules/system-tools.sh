#!/usr/bin/env bash

sudo apt update


### BEGIN Misc system tools
sudo apt install --yes sshfs curlftpfs gparted smartmontools secure-delete
### END Misc system tools


### BEGIN OpenVPN
sudo apt install --yes network-manager-openvpn
### END OpenVPN
