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

# these oh-my-zsh options hang on UWMC filesystems
unsetopt auto_cd
unsetopt cdablevarS

# prompt
PROMPT='%{$fg[cyan]%}%m:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# Customize to your needs...
export PATH=$HOME/my-env/bin:$HOME/my-env/edirect:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/app/bin
export EDITOR='vim'

# some pip stuff
export PYTHON_VERSION=$(python -c 'import platform; print(platform.python_version())')
export PIP_WHEEL_DIR=/molmicro/pip/wheelhouse/$PYTHON_VERSION
export PIP_FIND_LINKS=file://$PIP_WHEEL_DIR

### aliases
# gists
alias subcommand='gist 4486964'
alias sconstruct='gist 4487031'
alias p1_forward='gist 7837a716f653dcc5db0d'
alias p357_forward='gist 5f5e4ae11670742a16f3'
alias ion_16s_primer='gist b72ff4279b114eb84660'
alias bacteria16S_508_mod5.cm='gist b8da146181405feb9d0b'
alias p341_forward='gist 014cf417eed0bf627e56'
alias p926_forward='gist 5965150cda9208338d9c'
alias pyscript='gist c6f374799b0e2626ee9c'
alias contributors='gist f7c010a8ee856890d8bd'

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

function xl {
  in2csv $1 | cl
}

showtab () {
  sqlite3 -csv -header $1 "pragma table_info($2)" | csvlook
}

# everyone in group can read and write new files
umask 002

# configure autojump
# # https://github.com/joelthelion/autojump
# # https://github.com/cmccoy/oh-my-zsh

ajprof=/usr/share/autojump/autojump.zsh
  if [ -f $ajprof ]; then
  . $ajprof
  fi

function autojumpcomp () {
  cur=${words[2, -1]}
  autojump --completion ${=cur[*]} | while read i; do compadd -U "$i"; done
}
compdef autojumpcomp j

