#!/usr/bin/env bash

UBUNTU_VERSION=`lsb_release -r -s`

if [[ "${UBUNTU_VERSION}" != "${INSTALLER_VERSION}" ]] ; then
    message "ERROR: This installer is only for Ubuntu "
    exit 1;
fi

for DIR in .ssh .gnupg; do
    if [[ ! -d ~/${DIR} ]]; then
        message "Missing $ {DIR}: if you have generated, put them in your home directory, otherwise ignore.";
    fi

done
