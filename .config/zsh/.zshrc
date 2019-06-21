source "$XDG_CONFIG_HOME/zsh/inputrc"
source "$XDG_CONFIG_HOME/zsh/alias"
source "$XDG_CONFIG_HOME/zsh/func"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
