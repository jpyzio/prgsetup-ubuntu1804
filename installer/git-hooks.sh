#!/usr/bin/env bash

progress "Git hooks"

HOOKS_DIR="${ROOT_DIR}/git_hooks/"
USER_GIT_TEMPLATES_DIR="${HOME}/.git-templates/"
USER_GIT_HOOKS_DIR=${USER_GIT_TEMPLATES_DIR}hooks/

git config --global init.templatedir ${USER_GIT_TEMPLATES_DIR}

mkdir -p ${USER_GIT_HOOKS_DIR}

cp ${HOOKS_DIR}* ${USER_GIT_HOOKS_DIR}

chmod +x ${USER_GIT_HOOKS_DIR}*
