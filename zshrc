# shell
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
ZSH_THEME="robbyrussell"
plugins=(autojump git)
source $ZSH/oh-my-zsh.sh
PROMPT='%{$fg[cyan]%}%m:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

export PATH=$HOME/.local/bin:$PATH

export EDITOR='vim'
export PIP_WHEEL_DIR=$HOME/.local/pip/wheelhouse
export PIP_FIND_LINKS=file://$PIP_WHEEL_DIR
export SCONS_ENABLE_VIRTUALENV=1
export TMPDIR=$HOME/tmp

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

# everyone in group plus user can read and write new files
umask ug+rwx,o-rwx

mkdir -p $TMPDIR
mkdir -p $HOME/trash

# load .env file
if test -f $HOME/.env; then
  set -a && source $HOME/.env && set +a
fi
