#!/usr/bin/env bash

### BEGIN Redis Desktop Manager
sudo snap install redis-desktop-manager
### END Redis Desktop Manager


### BEGIN Insomnia
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list

sudo apt-get update
sudo apt-get install --yes insomnia
### END Insomnia


### BEGIN Postman
sudo snap install postman
### END Postman


### BEGIN Databases clients
sudo apt install --yes mysql-client postgresql-client mycli pgcli
### END Databases clients


### BEGIN Composer global tools
composer global require phpunit/phpunit
composer global require phing/phing
composer global require sebastian/phpcpd
composer global require phploc/phploc
composer global require phpmd/phpmd
composer global require squizlabs/php_codesniffer
### END Composer global tools
