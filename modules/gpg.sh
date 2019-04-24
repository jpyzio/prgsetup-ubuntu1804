#!/usr/bin/env bash

KEYGEN_CONFIG_FILE="${ROOT_DIR}/keygen_config"

sudo apt install -y gpa gpg

while [[ -z ${GPG_REAL_NAME} ]] ; do
    GPG_REAL_NAME=`input "GPG - Real name"`
done

while [[ -z ${GPG_EMAIL} ]] ; do
    GPG_EMAIL=`input "GPG - Email"`
done

while [[ -z ${GPG_PASSPHRASE} ]] ; do
    GPG_PASSPHRASE=`input "Git Global - Your name"`
done

echo "Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: ${GPG_REAL_NAME}
Name-Email: ${GPG_EMAIL}
Expire-Date: 0
Passphrase: ${GPG_PASSPHRASE}
" > ${KEYGEN_CONFIG_FILE}

gpg --gen-key --batch ${KEYGEN_CONFIG_FILE}

shred --remove --iterations=100 ${KEYGEN_CONFIG_FILE}

GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`
if [[ ! -z "${GPG_ID}" ]]; then
    echo "export GPGKEY=${GPG_ID}" >> ~/.bashrc
    echo "export GPGKEY=${GPG_ID}" >> ~/.zshrc
fi
