#!/usr/bin/env bash

progress "SSH Key"

PASSPHRASE=`zenity --password --title="SSH" --text="Enter your RSA key passphrase"`

if [[ -f ${HOME}/.ssh/id_rsa ]]; then
    zenity --info --title="SSH" --text="Your RSA key is already generated. Remove it if you want to generate new key." --width=200 --height=50
fi

mkdir "${HOME}/.ssh"
ssh-keygen -q -t rsa -N "${PASSPHRASE}" -o -a 100 -b 4096 -f "${HOME}/.ssh/id_rsa"


RSA_KEY=`cat ~/.ssh/id_rsa.pub`

zenity --entry --title="SSH" --text="Your RSA Public key, paste it into Git repositories" --entry-text="${RSA_KEY}"
