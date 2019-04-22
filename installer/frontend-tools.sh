#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

yarn global add @vue/cli

echo "export PATH=\"\$PATH:$(yarn global bin)\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:$(yarn global bin)\"" >> ~/.bashrc
