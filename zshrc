# shell
zstyle ':omz:update' mode auto
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
ZSH_THEME="robbyrussell"
plugins=(autojump git)
source $ZSH/oh-my-zsh.sh
PROMPT='%{$fg[cyan]%}%m:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

alias nseqs='grep -c ">"'
alias s3='sqlite3 -csv -header'
alias less='less -X'
alias sc='seqmagick convert'
alias si='seqmagick info'

# functions
function f {
  python -c "import pandas; pandas.set_option('display.max_columns', 500); print(pandas.read_feather(\"$1\"))"
}

# everyone in group plus user can read and write new files
umask ug+rwx,o-rwx

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# machine-specific overrides, not in version control
[[ -f ${ZDOTDIR:-$HOME}/.zshrc.local ]] && . ${ZDOTDIR:-$HOME}/.zshrc.local
