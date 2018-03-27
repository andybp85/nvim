#!/bin/zsh

if [[ ! -d $HOME/.config/nvim/repos/github.com/Shougo/dein.vim ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.config/nvim/installer.sh
  zsh ./installer.sh $HOME/.config/nvim
  rm ./installer.sh
fi

# I swear someday I'll have a need for C besides compiling stuff for the fun of it
curl https://raw.githubusercontent.com/neovim/neovim/master/contrib/YouCompleteMe/ycm_extra_conf.py >  $HOME/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py
nvim +"call dein#install()" +qall

