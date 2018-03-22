#!/bin/zsh
# cd $HOME/.config/nvim
eval "$(pyenv init -)"

if [[ ! -d $HOME/.pyenv/versions/neovim ]]; then
  pyenv virtualenv neovim
fi
pyenv activate neovim
pip install --upgrade pip
pip install neovim

if [[ ! -d $HOME/.config/nvim/repos/github.com/Shougo/dein.vim ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.config/nvim/installer.sh
  zsh ./installer.sh $HOME/.config/nvim
  rm ./installer.sh
fi

nvim +"call dein#install()" +qall

cd $HOME/.config/nvim/repos/github.com/klen/python-mode/pymode
git submodule update --init --recursive

cd $HOME/.config/nvim/repos/github.com/Valloric/YouCompleteMe
curl https://raw.githubusercontent.com/neovim/neovim/master/contrib/YouCompleteMe/ycm_extra_conf.py > .ycm_extra_conf.py
git submodule update --init --recursive
./install.py --js-completer --clang-completer

pyenv deactivate
