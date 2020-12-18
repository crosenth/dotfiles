# Linux/Unix configuration dotfiles

## Requirements

* Python 3.x
* Python 3 [venv](https://docs.python.org/3/library/venv.html) module

## Install

```
cd $HOME
python3 -venv --copies .local
pip3 install flake8 pep8
git clone --recursive https://github.com/crosenth/dotfiles.git
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/vim .vim
```
