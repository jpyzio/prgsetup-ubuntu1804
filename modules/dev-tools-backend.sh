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


### BEGIN PHP7.2
sudo apt install --yes php7.2-gd php7.2-intl php7.2-mysql php7.2-phpdbg php7.2-snmp php7.2-tidy php7.2-zip php7.2 \
php7.2-cli php7.2-dev php7.2-gmp php7.2-json php7.2-odbc php7.2-pspell php7.2-soap php7.2-xml php7.2-bcmath \
php7.2-common php7.2-enchant php7.2-imap php7.2-ldap php7.2-opcache php7.2-readline php7.2-sqlite3 php7.2-xmlrpc \
php7.2-bz2 php7.2-curl php7.2-interbase php7.2-mbstring php7.2-pgsql php7.2-recode php7.2-sybase php7.2-xsl \
php-xdebug
### END PHP7.2


### BEGIN Composer
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
### END Composer


### BEGIN Composer global tools
composer global require phpunit/phpunit
composer global require phing/phing
composer global require sebastian/phpcpd
composer global require phploc/phploc
composer global require phpmd/phpmd
composer global require squizlabs/php_codesniffer
### END Composer global tools
