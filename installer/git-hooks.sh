#!/usr/bin/env bash

TEMPLATES_PATH="${HOME}/.git-templates/"
HOOKS_PATH="${ROOT_DIR}/git_hooks/"

git config --global init.templatedir ${TEMPLATES_PATH}
mkdir -p ${TEMPLATES_PATH}hooks
cp ${HOOKS_PATH}* ${TEMPLATES_PATH}hooks/
chmod +x ${TEMPLATES_PATH}hooks/*
