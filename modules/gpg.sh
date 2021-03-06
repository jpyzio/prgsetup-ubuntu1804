#!/usr/bin/env bash

### BEGIN Update and install dependencies
sudo apt update
sudo apt install --yes secure-delete
### END Update and install dependencies

### BEGIN GPG and tools
sudo apt install --yes gpa gpg
### END GPG and tools

### BEGIN GPG configuration
KEYGEN_CONFIG_FILE="${ROOT_DIR}/keygen_config"

while [[ -z ${REAL_NAME} ]]; do
  REAL_NAME=$(input "Your Real Name")
done

while [[ -z ${EMAIL} ]]; do
  EMAIL=$(input "Your Email")
done

while [[ -z ${GPG_PASSPHRASE} ]]; do
  GPG_PASSPHRASE=$(password_input "Your Passphrase for GPG Key")
done

echo "Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: ${REAL_NAME}
Name-Email: ${EMAIL}
Expire-Date: 0
Passphrase: ${GPG_PASSPHRASE}
" >"${KEYGEN_CONFIG_FILE}"

gpg --gen-key --batch "${KEYGEN_CONFIG_FILE}"

shred --remove --iterations=100 "${KEYGEN_CONFIG_FILE}"

GPG_ID=$(gpg --list-secret-keys --with-colons 2>/dev/null | grep '^sec:' | cut --delimiter ':' --fields 5)
if [[ ! -z "${GPG_ID}" ]]; then
  sed --in-place --regexp-extended "s/.*export GPGKEY.*\n//g" ~/.bashrc ~/.zshrc

  echo "export GPGKEY=${GPG_ID}" >>~/.bashrc >>~/.zshrc

  if [[ $(command -v git) ]]; then
    git config --global user.signingkey "${GPG_ID}"
    git config --global commit.gpgsign true
  fi
fi
### END GPG configuration
