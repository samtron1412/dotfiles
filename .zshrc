#===============================================================================
# oh-my-zsh
#===============================================================================
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="amuse"
# ZSH_THEME="ys"
ZSH_CUSTOM=~/.zsh-custom

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git history-substring-search z)
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#===============================================================================
# ENVIROMENT VARIABLES
#===============================================================================
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl3'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Add this line if want to use ramdisk or SSD
# export CCACHE_DIR="/path/to/directory"
# export CCACHE_DIR="/tmp/ccache"
# export CCACHE_DIR="/home/ssd/ccache"

# Enable compiling your code from command line
# export PATH="/usr/lib/ccache/bin/:$PATH"

#===============================================================================
# ALIAS
#===============================================================================
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

#===============================================================================
# BINDING KEY
#===============================================================================

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
