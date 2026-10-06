# Linux/Unix configuration dotfiles

## Requirements

* Python 3.x

## Install

```
cd $HOME
python3 -m venv --copies .local
pip3 install flake8 pep8
git clone --recursive https://github.com/crosenth/dotfiles.git
ln -s dotfiles/zshenv .zshenv
ln -s dotfiles/zprofile .zprofile
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/vim .vim

## Machine-specific settings

Per-host overrides go in `~/.zshenv.local`, `~/.zprofile.local` or
`~/.zshrc.local`, sourced at the end of the tracked file and never committed.
