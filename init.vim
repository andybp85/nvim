" let g:python_host_prog = $HOME . '/.pyenv/versions/neovim/bin/python'
" let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim/bin/python'

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/ui.vim
source $HOME/.config/nvim/config/motion_search.vim
source $HOME/.config/nvim/config/editing.vim
source $HOME/.config/nvim/config/files.vim

" Debugging {{{
  " let g:vdebug_options['path_maps'] = {"": \""}
" }}}

" Modeline
" vim:foldmethod=marker:foldlevel=0
