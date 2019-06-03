#!/usr/bin/env bash

KEYGEN_CONFIG_FILE="${ROOT_DIR}/keygen_config"


### BEGIN Update and install dependencies
sudo apt update
sudo apt install --yes shred
### END Update and install dependencies


### BEGIN GPG and tools
sudo apt install --yes gpa gpg
### END GPG and tools


### BEGIN GPG configuration
while [[ -z ${REAL_NAME} ]] ; do
    REAL_NAME=`input "GPG - Real name"`
done

while [[ -z ${GPG_EMAIL} ]] ; do
    EMAIL=`input "GPG - Email"`
done

while [[ -z ${PASSPHRASE} ]] ; do
    PASSPHRASE=`input "Git Global - Your name"`
done

echo "Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: ${REAL_NAME}
Name-Email: ${EMAIL}
Expire-Date: 0
Passphrase: ${PASSPHRASE}
" > ${KEYGEN_CONFIG_FILE}

gpg --gen-key --batch ${KEYGEN_CONFIG_FILE}

shred --remove --iterations=100 ${KEYGEN_CONFIG_FILE}

GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`
if [[ ! -z "${GPG_ID}" ]]; then
    sed -i -E "s/.*export GPGKEY.*\n//g" ~/.bashrc
    sed -i -E "s/.*export GPGKEY.*\n//g" ~/.zshrc

    echo "export GPGKEY=${GPG_ID}" >> ~/.bashrc >> ~/.zshrc

    if [[ command -v git > /dev/null ]]; then
        git config --global user.signingkey ${GPG_ID}
        git config --global commit.gpgsign true
    fi
fi
### END GPG configuration
