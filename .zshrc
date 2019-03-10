CURRENT_DIR=$(dirname "$0")

[ -f ${CURRENT_DIR}/.env-config ] && source ${CURRENT_DIR}/.env-config
[ -f ${CURRENT_DIR}/.zshrc-magic ] && source ${CURRENT_DIR}/.zshrc-magic
[ -f ${CURRENT_DIR}/.zshrc-szp20 ] && source ${CURRENT_DIR}/.zshrc-szp20
[ -f ${CURRENT_DIR}/.zshrc-plugins ] && source ${CURRENT_DIR}/.zshrc-plugins
