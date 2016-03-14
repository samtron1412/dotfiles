HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# To ignore duplicate lines in the history
# setopt HIST_IGNORE_DUPS

# Set key bindings with vi mode
bindkey -v


zstyle :compinstall filename '/home/glider/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# Use prompt adam2
prompt adam2

setopt completealiases

# alias startx='ssh-agent startx'

export PATH="/home/glider/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export CCACHE_DIR="/ramdisk/ccache"
