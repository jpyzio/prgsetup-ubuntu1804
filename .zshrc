CURRENT_DIR=$(dirname "$0")

[ -f ${CURRENT_DIR}/.env-config ] && source ${CURRENT_DIR}/.env-config
[ -f ${CURRENT_DIR}/.zshrc-aliases ] && source ${CURRENT_DIR}/.zshrc-aliases
[ -f ${CURRENT_DIR}/.zshrc-szp20 ] && source ${CURRENT_DIR}/.zshrc-szp20

[ -f ${CURRENT_DIR}/bin/.zplug/init.zsh ] && source ${CURRENT_DIR}/bin/.zplug/init.zsh


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
