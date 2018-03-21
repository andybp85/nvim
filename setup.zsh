#!/bin/zsh
mkdir bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.config/nvim/installer.sh
zsh ./installer.sh $HOME/.config/nvim/bundles
rm ./installer.sh
