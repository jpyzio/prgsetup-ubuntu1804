#!/usr/bin/env bash

### BEGIN REST clients
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list

sudo apt update
sudo apt install --yes insomnia

sudo snap install postman
### END REST clients

### BEGIN Databases clients
sudo apt install --yes mysql-client postgresql-client mycli pgcli
### END Databases clients

### BEGIN PHP7.3
sudo apt install software-properties-common
sudo add-apt-repository --yes ppa:ondrej/php
sudo apt update

sudo apt install --yes php7.3-gd php7.3-intl php7.3-mysql php7.3-phpdbg php7.3-snmp php7.3-tidy php7.3-zip php7.3 \
  php7.3-cli php7.3-dev php7.3-gmp php7.3-json php7.3-odbc php7.3-pspell php7.3-soap php7.3-xml php7.3-bcmath \
  php7.3-common php7.3-enchant php7.3-imap php7.3-ldap php7.3-opcache php7.3-readline php7.3-sqlite3 php7.3-xmlrpc \
  php7.3-bz2 php7.3-curl php7.3-interbase php7.3-mbstring php7.3-pgsql php7.3-recode php7.3-sybase php7.3-xsl \
  php-xdebug php-memcached php-imagick php-mongodb
### END PHP7.3

### BEGIN Composer
curl --silent https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
### END Composer

### BEGIN Composer global tools
echo "export PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"" | tee --append ~/.zshrc ~/.bashrc

composer global require phpunit/phpunit
composer global require phing/phing
composer global require sebastian/phpcpd
composer global require phploc/phploc
composer global require phpmd/phpmd
composer global require squizlabs/php_codesniffer
### END Composer global tools

### BEGIN Framework installers
echo "export PATH=\"\$HOME/.symfony/bin:\$PATH\"" | tee --append ~/.zshrc ~/.bashrc

curl -sS https://get.symfony.com/cli/installer | bash
composer global require laravel/installer
composer global require laravel/lumen-installer
### END Framework installers
