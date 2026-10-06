mkdir -p $HOME/trash $TMPDIR $XDG_CACHE_HOME

# API keys and tokens not in version control
if [[ -f $HOME/.env ]]; then
  set -a && source $HOME/.env && set +a
fi

# machine-specific overrides, not in version control
[[ -f ${ZDOTDIR:-$HOME}/.zprofile.local ]] && . ${ZDOTDIR:-$HOME}/.zprofile.local
