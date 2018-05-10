" vim options {{{{
    set nocompatible
    set encoding=utf-8
    set ffs=unix,dos,mac
    set number
    set relativenumber
    set ruler
    set tabstop=4
    set shiftwidth=4
    if has('mouse') | set mouse=a | endif
    set expandtab                     " spaces for tabs
    set cursorline                    " highlight current line
    set lazyredraw                    " redraw only when we need to.
    set backspace=indent,eol,start
    set copyindent                    " copy the previous indentation on autoindenting
    set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
    set showmatch                     " set show matching parenthesis
    set smartcase                     " ignore case if search pattern is all lowercase, case-sensitive otherwise
    set hlsearch                      " highlight search terms
    set modelines=1                   " check just the final line of the file for a modeline
    set showcmd
    set ttimeout                      " timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays
    set timeoutlen=1000 ttimeoutlen=0
    " change the mapleader from \ to ,
    let mapleader=" "
    let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim/bin/python'
" }}}}

" wildmode {{{{
    " this is being set somewhere, not sure where
    " set wildmode=longest:full
    set wildmenu
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" }}}}

" move backups to the /tmp folder {{{{
    set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set writebackup
" }}}}

" conceal {{{{
    " 0    Text is shown normally
    " 1    Each block of concealed text is replaced with one
    "         character.  If the syntax item does not have a custom
    "         replacement character defined (see |:syn-cchar|) the
    "         character defined in 'listchars' is used (default is a
    "         space).
    "         It is highlighted with the "Conceal" highlight group.
    " 2    Concealed text is completely hidden unless it has a
    "         custom replacement character defined (see
    "         |:syn-cchar|).
    " 3    Concealed text is completely hidden.
    set conceallevel=1
" }}}}

" Allow color schemes to do bright colors without forcing bold {{{{
    if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
        set t_Co=16
    endif
" }}}}

" spell checking {{{{
    set spelllang=en
    set spellfile=$HOME/Documents/vim/spell/en.utf-8.add

    " toggle spelling with F1
    " can add multiple langs to myLangList and cycle through
    let b:myLang=0
    let g:myLangList=["nospell","en_us"]
    function! ToggleSpell()
        let b:myLang=b:myLang+1
        if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
        endif
        echo "spell checking language:" g:myLangList[b:myLang]
    endfunction
    nmap <silent> <F1> :call ToggleSpell()<CR>
" }}}}

" custom maps {{{{
    " maps the ,ev and ,sv keys to edit/reload .vimrc
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

    " make :h expand to :ver h
    cabbrev h vert h
    cabbrev help vert help

    " captitols in :wq mistages
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq

    cnoreabbrev tn tabnext
    cnoreabbrev tnew tabnew

    " splits (match tmux)
    " nmap <silent> <C-b>" :split<CR>
    " nmap <silent> <C-b>% :vsplit<CR>

    " resizing with , # need to think about this
    " nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
    " nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

    " ctl+h/j/k/l for splits motion
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " resize splits with ctl++/-/=/>/<
    " nnoremap <C-+> <C-W><C-+>
    " nnoremap <C--> <C-W><C-->
    " nnoremap <C-=> <C-W><C-=>
    " nnoremap <C->> <C-W><C->>
    " nnoremap <C-<> <C-W><C-<>

    " resize with arrows
    nnoremap <Left> :vertical resize -5<CR>
    nnoremap <Right> :vertical resize +5<CR>
    nnoremap <Up> :resize -1<CR>
    nnoremap <Down> :resize +1<CR>

    " easier write/quit
    nmap <leader>w :w!<cr>
    nmap <leader>q :q<cr>
    nmap <leader>wa :wa<cr>
    nmap <leader>wq :wq<cr>
    nmap <leader>qa :qa<cr>
    nmap <leader>wqa :wqa<cr>

    nmap <silent> <leader>tt :TrailerTrim<CR>
    nmap <silent> <leader>TT :TagbarToggle<CR>
    let g:minimap_toggle='<leader>M'
" }}}}

" Modeline
" vim:foldmethod=marker:foldlevel=0
