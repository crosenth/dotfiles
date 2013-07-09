# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

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
export PATH=/home/local/AMC/crosenth/env/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/app/bin

### aliases
# gists
alias subcommand='gist 4486964'
alias sconstruct='gist 4487031'
alias p1_forward='gist 7837a716f653dcc5db0d'
alias p357_forward='gist 5f5e4ae11670742a16f3'
alias p3_forward='gist b7e19b43233269573334'
alias ion_16s_primer='gist b72ff4279b114eb84660'
alias bacteria16S_508_mod5.cm='gist b8da146181405feb9d0b'

alias srun='srun -v'
alias nseqs='grep -c ">"'
alias s3='sqlite3 -csv -header'
alias less='less -X'
alias sc='seqmagick convert'
alias si='seqmagick info'

# funtions
function gist {
  # print contents of the first file in the gist to stdout
  curl -s https://api.github.com/gists/$1 | python -c 'import json, sys; print json.load(sys.stdin)["files"].items()[0][1]["content"]'
}

function cl {
  csvlook $1 | less -S
}

showtab () {
  sqlite3 -csv -header $1 "pragma table_info($2)" | csvlook
}

# everyone in group can read and write new files
umask 002

# configure autojump
# # https://github.com/joelthelion/autojump
# # https://github.com/cmccoy/oh-my-zsh

ajprof=/usr/local/etc/profile.d/autojump.zsh
  if [ -f $ajprof ]; then
  . $ajprof
  fi

function autojumpcomp () {
  cur=${words[2, -1]}
  autojump --completion ${=cur[*]} | while read i; do compadd -U "$i"; done
}
compdef autojumpcomp j

# speed up tab completion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/dotfiles/oh-my-zsh/cache
