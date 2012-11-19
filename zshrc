# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/crosenth/bin:/home/matsengrp/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/app/bin

# funtions
function gist {
  # print contents of the first file in the gist to stdout
  curl -s https://api.github.com/gists/$1 | python -c 'import json, sys; print json.load(sys.stdin)["files"].items()[0][1]["content"]'
}
function cl {
  csvlook $1 | less -S
}

# aliases
alias pytemp='gist 3006600'

# everyone in group can read and write new files
umask 002

# configure autojump
# # https://github.com/joelthelion/autojump
# # https://github.com/cmccoy/oh-my-zsh

ajprof=/home/matsengrp/local/etc/profile.d/autojump.zsh
  if [ -f $ajprof ]; then
  . $ajprof
  fi

function autojumpcomp () {
  cur=${words[2, -1]}
  autojump --completion ${=cur[*]} | while read i; do compadd -U "$i"; done
}
compdef autojumpcomp j


