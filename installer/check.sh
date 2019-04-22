#!/usr/bin/env bash

UBUNTU_VERSION=`lsb_release -r -s`

if [[ "${UBUNTU_VERSION}" != "${INSTALLER_VERSION}" ]] ; then
    echo -e "\e[31mERROR: This installer is only for Ubuntu ${INSTALLER_VERSION}\e[39m"
    exit 1;
fi

for DIR in ~/.ssh ~/.gnupg; do
    if [[ ! -d ${DIR} ]]; then
        echo -e "\e[33mMissing ${DIR}: if you have generated, put them in your home directory, otherwise ignore.\e[39m";
        read;
    fi
done
