" General {{{

    " vim options {{{{
        set nocompatible                  " be iMproved, required
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
"         nmap <silent> <C-b>" :split<CR>
"         nmap <silent> <C-b>% :vsplit<CR>

        " resizing with , # need to think about this
"         nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"         nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

        " ctl+h/j/k/l for splits motion
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

        " resize splits with ctl++/-/=/>/<
"         nnoremap <C-+> <C-W><C-+>
"         nnoremap <C--> <C-W><C-->
"         nnoremap <C-=> <C-W><C-=>
"         nnoremap <C->> <C-W><C->>
"         nnoremap <C-<> <C-W><C-<>
        " resize with arrows
        nnoremap <Left> :vertical resize -5<CR>
        nnoremap <Right> :vertical resize +5<CR>
        nnoremap <Up> :resize -1<CR>
        nnoremap <Down> :resize +1<CR>

        " easier write/quit
        nmap <leader>w :w!<cr>
        nmap <leader>q :q<cr><Paste>
        nmap <leader>wq :wq<cr><Paste>
        nmap <leader>qa :qa<cr><Paste>
        nmap <leader>wqa :wqa<cr><Paste>

        nmap <silent> <leader>tt :TrailerTrim<CR>
        nmap <silent> <leader>TT :TagbarToggle<CR>
        let g:minimap_toggle='<leader>M'
    " }}}}

"}}}

" Plugins {{{

    " dein START {{{{
        set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
        call dein#begin('~/.config/nvim')
        call dein#add('Shougo/dein.vim')
    " }}}}

    " filesystem {{{{
        call dein#add('airblade/vim-rooter')
        " call dein#add('ctrlpvim/ctrlp.vim') " fuzzy file matching
        call dein#add('junegunn/fzf')
        call dein#add('junegunn/fzf.vim')
        call dein#add('tpope/vim-vinegar') " beef up vim's file browser
        " call dein#add('twe4ked/vim-peepopen')
        " call dein#add('scrooloose/nerdtree')
    " }}}}

    " text editing {{{{
        call dein#add('scrooloose/nerdcommenter')
        call dein#add('godlygeek/tabular') " quickly align code
        call dein#add('csexton/trailertrash.vim') " trim whitespace
        call dein#add('dominika/vim-todos')
        call dein#add('nathanaelkane/vim-indent-guides')
        call dein#add('tpope/vim-surround') " key commands to surround words & more
        call dein#add('tpope/vim-repeat')
        call dein#add('tpope/vim-speeddating')
        " call dein#add('jiangmiao/auto-pairs')
        " call dein#add('vim-scripts/paredit.vim')
    " }}}}

    " utils {{{{
        call dein#add('sjl/gundo.vim') " undo tree manager
        call dein#add('tpope/vim-fugitive') " git
        call dein#add('bling/vim-airline') " status line
        call dein#add('jeetsukumaran/vim-buffergator') " buffer, window, tab mgmt
        call dein#add('tpope/vim-dispatch') " run commands asynchronously from Vim
        " call dein#add('tpope/vim-tbone') " tmux integration, send code to pane
        call dein#add('rking/ag.vim') " silver searcher (better grep)
        call dein#add('tpope/vim-eunuch') " better unix commands
        " call dein#add('joonty/vdebug.git') " debugging
    " }}}}

    " motion & search {{{{
        call dein#add('easymotion/vim-easymotion') " very much so
        call dein#add('haya14busa/incsearch.vim') " improve incremental search
        call dein#add('haya14busa/incsearch-fuzzy.vim') " add fuzzy searching
        call dein#add('haya14busa/incsearch-easymotion.vim') " make it easy
    " }}}}

    " lang-agnostic {{{{
        call dein#add('Valloric/YouCompleteMe') " BEST PLUGIN EVER. make autocomplete feel like sex
        call dein#add('w0rp/ale') " new hotness for linting
        call dein#add('kien/rainbow_parentheses.vim') " matfching parens in dif colors
        call dein#add('majutsushi/tagbar') " auto-generate index for code files
        call dein#add('SirVer/ultisnips') " snippits, integrates with YCM
        call dein#add('honza/vim-snippets') " code for snippets
        call dein#add('severin-lemaignan/vim-minimap')
    " }}}}

    " lang-specific {{{{

        " javascript {{{{{
            call dein#add('claco/jasmine.vim')
            call dein#add('othree/javascript-libraries-syntax.vim')
            call dein#add('burnettk/vim-angular')
            " call dein#add('alexlafroscia/vim-ember-cli')
            call dein#add('neovim/node-host')
            call dein#add('bigfish/vim-js-context-coloring')
            call dein#add('pangloss/vim-javascript')
            call dein#add('mxw/vim-jsx')
            call dein#add('leafgarland/typescript-vim')
            call dein#add('HerringtonDarkholme/yats.vim')
            call dein#add('Shougo/vimproc.vim')
            call dein#add('Quramy/tsuquyomi')
            call dein#add('purescript-contrib/purescript-vim')
        " }}}}}

        " HTML et al {{{{{
            call dein#add('othree/html5.vim')
            call dein#add('plasticboy/vim-markdown')
            call dein#add('gregsexton/MatchTag')
        " }}}}}

        " PHP {{{{{
            call dein#add('StanAngeloff/php.vim')
        " }}}}}

        " Lisp(s) {{{{{
            " call dein#add('kovisoft/slimv')
            call dein#add('hylang/vim-hy')
            call dein#add('guns/vim-sexp')
            call dein#add('wlangstroth/vim-racket')
            " call dein#add('jpalardy/vim-slime')
        " }}}}}

        " Clojure {{{{{
            call dein#add('guns/vim-clojure-static')
            call dein#add('guns/vim-clojure-highlight')
            call dein#add('tpope/vim-fireplace')
            call dein#add('tpope/vim-classpath')
            call dein#add('venantius/vim-eastwood')
        " }}}}}

        " Python {{{{{
            call dein#add('klen/python-mode')
            " call dein#add('ivanov/vim-ipython')
        " }}}}}

        " Haskell {{{{{
            call dein#add('parsonsmatt/intero-neovim')
            call dein#add('neovimhaskell/haskell-vim')
            call dein#add('alx741/vim-hindent')
        " }}}}}

        " Misc {{{{{
            call dein#add('ElmCast/elm-vim')
            call dein#add('daveyarwood/vim-alda')
            call dein#add('chrisbra/csv.vim')
        " }}}}}

    " }}}}

    " color schemes & icons {{{{
        call dein#add('morhetz/gruvbox')
        call dein#add('ryanoasis/vim-devicons')
    " }}}}

    " dein END {{{{
        call dein#end()
        call dein#save_state()

        filetype plugin indent on
        syntax enable

        if dein#check_install()
            call dein#install()
        endif
    " }}}}

" }}}

" Plugin Setup {{{

    " YouCompleteMe {{{{
        let g:ycm_global_ycm_extra_conf = '~/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py'
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_seed_identifiers_with_syntax = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_semantic_triggers = {'haskell' : ['.']}
    " }}}}

    " Tagbar {{{{
        let g:tagbar_width = 30
        let g:tagbar_show_linenumbers = 1
        nmap <leader>T :TagbarToggle<CR>
    " }}}}

" }}}

" GUI & Colors {{{

    " theme & font {{{{
        " syntax on
        set termguicolors
        let g:gruvbox_italic=1
        let g:gruvbox_contrast_dark="hard"
        colorscheme gruvbox
        set background=dark
        hi Conceal guibg=#000000
    " }}}}

    " macvim gui {{{{
        set gfn=Sauce\ Code\ Pro\ Semibold\ Nerd\ Font\ Complete:h12
        " see help guioptions & set guioptions?
        set guioptions=ie
    "}}}}

    " airline {{{{{
        set laststatus=2
        " let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#whitespace#enabled = 0
        let g:airline_powerline_fonts = 1
        let g:Powerline_symbols = 'fancy'
        let g:syntastic_enable_signs = 1
        let g:airline#extensions#csv#column_display = 'Name'
    " }}}}

    " youCompleteMe {{{{
        " highlight color
        highlight Pmenu ctermfg=0 ctermbg=4 guifg=#ffffff guibg=#0000ff
    " }}}}

    " TrailorTrash {{{{
        " coloring
        hi UnwantedTrailerTrash guibg=black ctermbg=black
    " }}}}

    " RainbowParentheses {{{{
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }}}}

    " minimap {{{{
        let g:minimap_highlight='Visual'
    " }}}}

" }}}

" Motion & Search {{{

    " incsearch.vim x fuzzy x vim-easymotion {{{{
        set hlsearch
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)
        map z/ <Plug>(incsearch-easymotion-/)
        map z? <Plug>(incsearch-easymotion-?)
        map zg/ <Plug>(incsearch-easymotion-stay)
        " :h g:incsearch#auto_nohlsearch
        let g:incsearch#auto_nohlsearch = 1
        map n  <Plug>(incsearch-nohl-n)
        map N  <Plug>(incsearch-nohl-N)
        map *  <Plug>(incsearch-nohl-*)
        map #  <Plug>(incsearch-nohl-#)
        map g* <Plug>(incsearch-nohl-g*)
        map g# <Plug>(incsearch-nohl-g#)

        function! s:config_easyfuzzymotion(...) abort
            return extend(copy({
            \   'converters': [incsearch#config#fuzzy#converter()],
            \   'modules': [incsearch#config#easymotion#module()],
            \   'keymap': {"\<CR>": '<Over>(easymotion)'},
            \   'is_expr': 0,
            \   'is_stay': 1
            \ }), get(a:, 1, {}))
        endfunction
        noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    " }}}}

    " YCM {{{{
        nnoremap <leader>yg :YcmCompleter GoTo<CR>
        nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
    " }}}}

    " custom mappings {{{{
        " block keyboard keys in insert mode
        imap <up> <nop>
        imap <down> <nop>
        imap <left> <nop>
        imap <right> <nop>

        " don't jump lines
        nnoremap j gj
        nnoremap k gk
    " }}}}

" }}}

" Editing {{{

    " commenting {{{{
        "disable auto commenting
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDTrimTrailingWhitespace = 1
        let g:NERDDefaultAlign = "start"
    " }}}}

    " insert single char {{{{
        " http://vim.wikia.com/wiki/Insert_a_single_character
        :nnoremap <leader>i :exec "normal i".nr2char(getchar())."\e"<CR>
        :nnoremap <leader>a :exec "normal a".nr2char(getchar())."\e"<CR>
    " }}}}

    " gundo {{{{{
        let g:gundo_right = 1
        nnoremap <leader>U :GundoToggle<CR>
    " }}}}

    " ag.vim {{{{
        nnoremap <leader>a :Ag<space>
    " }}}}

    " snippets {{{{
        let g:UltiSnipsExpandTrigger="<c-s>"
        let g:UltiSnipsJumpForwardTrigger="<c-f>"
        let g:UltiSnipsJumpBackwardTrigger="<c-d>"
    " }}}}

    " YCM {{{{
        nnoremap <leader>yt :YcmCompleter GetType<CR>
        nnoremap <leader>yd :YcmCompleter GetDoc<CR>
        nnoremap <leader>yx :YcmCompleter FixIt<CR>
        nnoremap <leader>yf :YcmCompleter RefactorRename<CR>
    " }}}}

    " Tbone {{{
        nnoremap <leader>r :Twrite<CR>
    " }}}

    " custom mappings {{{{
        " F2 to toggle paste mode
        " set pastetoggle=<leader>pp

        " whenever you type % you jump to the matching object, and you visually select all the text in between
        noremap % v%

        " add sudo with :w!!
        cmap w!! w !sudo tee % >/dev/null

        " smart insert colon
        inoremap <leader>; <esc>A;
    " }}}}

" }}}

" Folding {{{

    " http://vim.wikia.com/wiki/Folding
    set foldlevelstart=0

    " skip line between fold (needs work)
    " :set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

    " enable syntax and manual folding
    " autocmd BufNewFile * echo expand('<amatch>') expand('<afile>')
    augroup vimrc
    " au Syntax if (expand("<amatch>")) != "javascript" | setlocal foldmethod=syntax | endif
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
    au Syntax python normal zr
    augroup END

    " use spacebar to fold/unfold, vselect+space to manual fold
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf

" }}}

" File Mgmt {{{

    " Buffergator {{{{
        " not a fan of default keymaps
        let g:buffergator_suppress_keymaps = 1
        nnoremap <leader>B :BuffergatorToggle<CR>
        nnoremap <leader>BT :BuffergatorTabsToggle<CR>
    " }}}}

    " CtrlP {{{{
        " default command
        " let g:ctrlp_map = '<c-p>'
        " let g:ctrlp_cmd = 'CtrlP'
        " let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
        " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        " let g:ctrlp_working_path_mode = 'cra'
    " }}}}

    " FZF {{{{
      nmap <Leader>b :Buffers<CR>
      nmap <Leader>t :Files<CR>
      nmap <Leader>r :Tags<CR>

    " }}}}

    " fix up netrw {{{{
        " let g:netrw_banner = 0
        let g:netrw_liststyle = 3
        " let g:netrw_browse_split = 0
        let g:netrw_altv = 1
        " let g:netrw_winsize = 25
        let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
        " toggle netrw
        nnoremap <leader>f :Explore<CR>
    " }}}}

    " rooter {{{{
        let g:rooter_silent_chdir = 1
    " }}}}

" }}}

" Debugging {{{
  " let g:vdebug_options['path_maps'] = {"": \""}
" }}}

" Modeline
" vim:foldmethod=marker:foldlevel=0
