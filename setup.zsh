#!/bin/zsh
# cd $HOME/.config/nvim
# eval "$(pyenv init -)"

# if [[ ! -d $HOME/.pyenv/versions/neovim ]]; then
#   pyenv virtualenv neovim
# fi
# pyenv activate neovim
# pip install --upgrade pip
# pip install neovim

if [[ ! -d $HOME/.config/nvim/repos/github.com/Shougo/dein.vim ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.config/nvim/installer.sh
  zsh ./installer.sh $HOME/.config/nvim
  rm ./installer.sh
fi

curl https://raw.githubusercontent.com/neovim/neovim/master/contrib/YouCompleteMe/ycm_extra_conf.py >  $HOME/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py
nvim +"call dein#install()" +qall

# pyenv deactivate
