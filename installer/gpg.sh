#!/usr/bin/env bash

sudo apt install -y gpa gpg

# TODO: generate safe gpg key
#gpg --gen-key

GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`
if [[ ! -z "${GPG_ID}" ]]; then
    echo "export GPGKEY=${GPG_ID}" >> ~/.bashrc
    echo "export GPGKEY=${GPG_ID}" >> ~/.zshrc
fi