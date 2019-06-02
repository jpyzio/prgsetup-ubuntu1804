#!/usr/bin/env bash

sudo apt install -y openssh-server

sudo sed -i -E "s/.*PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*PermitEmptyPasswords.*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*ClientAliveInterval.*/ClientAliveInterval 600/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*ClientAliveCountMax.*/ClientAliveCountMax 0/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*X11Forwarding.*/X11Forwarding no/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*Banner.*/Banner \/etc\/issue/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*IgnoreRhosts.*/IgnoreRhosts yes/g" /etc/ssh/sshd_config
sudo sed -i -E "s/.*HostbasedAuthentication.*/HostbasedAuthentication no/g" /etc/ssh/sshd_config

sudo adduser ${user} sudo

sudo service ssh restart


#Install fail2ban for openssh server
