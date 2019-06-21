########################################################################
#                        ENVIRONMENT VARIABLES                         #
########################################################################

# Add additional directories to the path.
pathadd() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+"$PATH:"}$1"
}

# Personal scripts and binaries
pathadd $HOME/bin

# Most of them are Python scripts
pathadd $HOME/.local/bin
pathadd $HOME/Library/Python/3.7/bin

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

# openssl
export PATH=$(brew --prefix openssl)/bin:$PATH

# vim
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim

# Make sure this terminfo are installed at
# /usr/share/terminfo or ~/.terminfo
export TERM="xterm-256color-italic"

# Fuzzy search command
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --follow --glob "!.git"'



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


############
#  PACMAN  #
############

alias sudo='sudo '
alias cu='checkupdates'
alias po='poweroff'
alias rb='reboot'
alias pm='pacman'

# Update the full system
alias pmu='sudo pm -Syu'

# Install a new package
alias pms='sudo pm -S'

# Search a online package
alias pmss='pm -Ss'

# Query the info of a online package
alias pmsi='pm -Si'

# Query the local package owner of a program
alias pmqo='pm -Qo'

# Query the info of a local package
alias pmqi='pm -Qi'

# Show the non official packages
alias pmqm='pm -Qm'

# Show the official packages
alias pmqn='pm -Qn'

# List all files owned by a package
alias pmql='pm -Ql'

# Search in local packages
alias pmqs='pm -Qs'

# Remove a package and leaving all of its dependencies
alias pmr='sudo pm -R'

# Remove a package and its dependencies
alias pmrs='sudo pm -Rs'

alias pmrsc='sudo pm -Rsc'
alias pmro='sudo pm -Rns $(pm -Qtdq)'


##########
#  APPS  #
##########

# Take a screenshoot with a selection tool
alias maims='maim -s ~/img/screen/$(date +%F-%T).png'

# Connect to raspberry pi
alias pi='ssh pi@192.168.2.36'

# Connect to raspberry pi and use screen
alias pis='ssh -t pi@192.168.2.36 screen -R'

# Using netctl to connect to wifi with the encryption option
alias wifi='sudo wifi-menu -o'

# Using info to read manual with vi keybinding
alias info='info --vi-keys'

# List all directories
alias ldi="ls -lah | egrep '^d'"

# List all files
alias lfi="ls -lah | egrep '^-'"

# List all symlinks
alias lli="ls -lah | egrep '^l'"

# Mount a new block device
alias musb="udisksctl mount -b"

# Unmount a block device
alias uusb="udisksctl unmount -b"

# Arranges for the device to be safely removed
alias rmusb="udisksctl power-off -b"

# Show detail information of a block device
alias usbinfo="udisksctl info -b"

# Start openvpn and wpa_cli at home
alias home="systemctl start openvpn-client@la2.service && systemctl start wpa_cli.service"

# Stop openvpn and wpa_cli at school
alias school="systemctl stop openvpn-client@la2.service && systemctl stop wpa_cli.service"

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
