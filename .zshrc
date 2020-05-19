#### Uncomment the following lines to profile ZSH
# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '

# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
# setopt XTRACE
#### Uncomment the above lines to profile ZSH



########################################################################
#                        ENVIRONMENT VARIABLES                         #
########################################################################

# Clear the PATH before sourcing /etc/profile to preserve PATH in tmux
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Add additional directories to the path.
pathadd() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

# Personal scripts and binaries
pathadd $HOME/bin

# Python scripts
pathadd $HOME/Library/Python/3.7/bin

# openssl: run 'brew --prefix openssl' to find the path
# Using hardcode path is much faster than using brew
pathadd "/usr/local/opt/openssl/bin"

# homebrew
pathadd "/usr/local/sbin"

# ruby
# export PATH=/usr/local/opt/ruby/bin:$PATH
pathadd "/usr/local/opt/ruby/bin"
pathadd "$HOME/.gem/ruby/2.6.0/bin"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export VISUAL='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# Add this line if want to use ramdisk or SSD
# export CCACHE_DIR="/path/to/directory"
# export CCACHE_DIR="/tmp/ccache"
# export CCACHE_DIR="/home/ssd/ccache"

# Enable compiling your code from command line
# export PATH="/usr/lib/ccache/bin/:$PATH"

# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CACHE_HOME="$HOME/.cache"

# Change root directory
export CHROOT="$HOME/chroot"

# Weechat home directory
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# Browsers
if [ -n "$DISPLAY" ]; then
    export BROWSER=chromium
else
    export BROWSER=w3m
fi

# rclone
export RCLONE_DRIVE_USE_TRASH=true

# vifm
export VIFM="~/.config/vifm"

# pyenv
if hash pyenv 2>/dev/null; then
  eval "$(pyenv init -)"
fi

# vim
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim

# Make sure this terminfo are installed at
# /usr/share/terminfo or ~/.terminfo
export TERM="xterm-256color-italic"

# Fuzzy search command
export FZF_DEFAULT_COMMAND='rg --files'



########################################################################
#                              oh-my-zsh                               #
########################################################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="amuse"
# ZSH_THEME="ys"
ZSH_CUSTOM=$HOME/.zsh-custom

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git history-substring-search z jump colored-man-pages)
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Key bindings
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# extended_glob
setopt extended_glob



########################################################################
#                               ALIASES                                #
########################################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


##########
#  APPS  #
##########

# docker
alias dk="docker"
alias dkm="docker-machine"
alias dkc="docker-compose"

# List all directories
alias ldi="ls -lah | egrep '^d'"

# List all files
alias lfi="ls -lah | egrep '^-'"

# List all symlinks
alias lli="ls -lah | egrep '^l'"

# jump plugin for zsh
alias j="jump"
alias m="mark"
alias ms="marks"
alias um="unmark"

# for custom terminfo
alias ssh='TERM=xterm-256color ssh'



########################################################################
#                              FUNCTIONS                               #
########################################################################

# Instal or upgrade a global Python package
# Since we set require-virtualenv = true at Application Support/pip/pip.conf
gpip(){
   PIP_REQUIRE_VIRTUALENV="0" pip3 "$@"
}

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.rar)      unrar x "$1"                          ;;
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      cat "$1" | pax -r                     ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$1' is not a valid file to extract"
  fi
}

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



#### Uncomment the following line to profile ZSH
# unsetopt XTRACE
# exec 2>&3 3>&-
#### Uncomment the above lines to profile ZSH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

