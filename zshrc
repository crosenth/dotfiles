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

# prompt
PROMPT='%{$fg[cyan]%}%m:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# if on the Hutch machines
if [[ -f /etc/profile.d/modules.sh ]]; then
  # use `module avail` for available modules
  source /etc/profile.d/modules.sh
  module load Python/3.8.2-GCCcore-9.3.0
  module load tmux/3.0-GCCcore-8.3.0
fi

export PATH=$HOME/.local/bin:$HOME/.local/share/jdk-18.0.2/bin:$PATH
export EDITOR='vim'
export PIP_WHEEL_DIR=$HOME/.pip/wheelhouse
export PIP_FIND_LINKS=file://$PIP_WHEEL_DIR
export TMPDIR=$HOME/tmp
export NGS16S=/mnt/disk2/molmicro/common/ncbi/16s
export SCONS_ENABLE_VIRTUALENV=1

# rootless Docker
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

### aliases
# gists
alias p1_forward='gist 7837a716f653dcc5db0d'
alias p357_forward='gist 5f5e4ae11670742a16f3'
alias p341_forward='gist 014cf417eed0bf627e56'
alias p926_forward='gist 5965150cda9208338d9c'
alias pyscript='gist c6f374799b0e2626ee9c'

# snippets
alias nseqs='grep -c ">"'
alias s3='sqlite3 -csv -header'
alias less='less -X'
alias sc='seqmagick convert'
alias si='seqmagick info'

# funtions
function f {
  python -c "import pandas; pandas.set_option('display.max_columns', 500); print(pandas.read_feather(\"$1\"))"
}

function gist {
  # print contents of the first file in the gist to stdout
  curl -s https://api.github.com/gists/$1 | python3 -c 'import json, sys; print(list(json.load(sys.stdin)["files"].items())[0][1]["content"])'
}

function snippet {
  curl --silent --insecure --header "PRIVATE-TOKEN: $1" \
  https://gitlab.labmed.uw.edu/api/v3/projects/$2/snippets/$3/raw | tr --delete '\r'
}

function xt {
  xsv table "$@" | less -S
}

# everyone in group plus user can read and write new files
umask ug+rwx,o-rwx

# configure autojump
# https://github.com/joelthelion/autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
