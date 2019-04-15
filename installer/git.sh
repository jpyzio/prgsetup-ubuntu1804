#!/usr/bin/env bash

progress "Git"

sudo apt install -y git gitk gitstats meld


while [[ -z ${GIT_USER_NAME} ]] ; do
    GIT_USER_NAME=`input "Git Global - Your name"`
done
git config --global user.name "${GIT_USER_NAME}"


while [[ -z ${GIT_EMAIL} ]] ; do
    GIT_EMAIL=`input "Git Global - Your Email"`
done
git config --global user.email "${GIT_EMAIL}"


GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`
if [[ ! -z "${GPG_ID}" ]]; then
    git config --global user.signingkey ${GPG_ID}
    git config --global commit.gpgsign true
fi


echo -e "npm-debug.log\n.DS_Store\nThumbs.db\n.idea/\n*~\n*.log" | tee -a ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
