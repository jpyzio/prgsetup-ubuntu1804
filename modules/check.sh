#!/usr/bin/env bash


### BEGIN Check system
UBUNTU_VERSION=`lsb_release --release --short`

if [[ "${UBUNTU_VERSION}" != "${CONFIGURATOR_VERSION}" ]] ; then
    echo -e "\e[31mERROR: This configurator is only for Ubuntu ${CONFIGURATOR_VERSION}\e[39m"
    exit 1;
fi

for DIR in ~/.ssh ~/.gnupg; do
    if [[ ! -d ${DIR} ]]; then
        echo -e "\e[33mMissing ${DIR}: if you have generated, put them in your home directory, otherwise ignore. Press [ENTER]\e[39m";
        read;
    fi
done
### END Check system
