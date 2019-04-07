#!/usr/bin/env bash

sudo apt install -y git gitk gitstats meld

GIT_USER_NAME=`input "Git Global - Your name"`
if [[ ! -z "${GIT_USER_NAME}" ]]; then
    git config --global user.name "${GIT_USER_NAME}"
fi

GIT_EMAIL=`input "Git Global - Your Email"`
if [[ ! -z "${GIT_EMAIL}" ]]; then
    git config --global user.email "${GIT_EMAIL}"
fi

GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`

if [[ ! -z "${GPG_ID}" ]]; then
    git config --global user.signingkey ${GPG_ID}
fi

echo ".idea/" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global