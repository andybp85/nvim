#!/bin/zsh

# if [[ ! -d $(pyenv root)/plugins/pyenv-virtualenv ]]; then
#     git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
# fi
# 
# eval "$(pyenv init -)"
# 
# if [[ ! -d $HOME/.pyenv/versions/neovim ]]; then
#   pyenv virtualenv neovim
# fi
# pyenv activate neovim
# pip install --upgrade pip
# pip install neovim
# pyenv deactivate

if [[ ! -d $HOME/.config/nvim/repos/github.com/Shougo/dein.vim ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.config/nvim/installer.sh
  zsh ./installer.sh $HOME/.config/nvim
  rm ./installer.sh
fi

# I swear someday I'll have a need for C besides compiling stuff for the fun of it
if [[ ! -f $HOME/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py ]]; then
    curl https://raw.githubusercontent.com/neovim/neovim/master/contrib/YouCompleteMe/ycm_extra_conf.py >  $HOME/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py
fi

nvim +"call dein#install()" +qall


