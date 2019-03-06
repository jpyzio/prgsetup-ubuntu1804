#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0");

echo "[Progress] Install GPG";

GPG_ID=`gpg --list-secret-keys --with-colons 2> /dev/null | grep '^sec:' | cut --delimiter ':' --fields 5`
echo "export GPGKEY=${GPG_ID}" >> ${CURRENT_DIR}/../.env-config
