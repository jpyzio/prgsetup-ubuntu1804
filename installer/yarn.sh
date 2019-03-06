#!/usr/bin/env bash

echo "[Progress] Install Node & Yarn";

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
