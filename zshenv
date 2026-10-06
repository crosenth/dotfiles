typeset -U path

export COLORTERM=truecolor
export EDITOR='vim'
export SCONS_ENABLE_VIRTUALENV=1
export XDG_CACHE_HOME=$HOME/.cache
export TMPDIR=$HOME/tmp
export PIP_WHEEL_DIR=$HOME/.local/pip/wheelhouse
export PIP_FIND_LINKS=$PIP_WHEEL_DIR
export PIP_DISABLE_PIP_VERSION_CHECK=1
export NVM_DIR="$HOME/.nvm"

path=($HOME/.local/bin $HOME/.local/share/jdk-18.0.2/bin $path)
