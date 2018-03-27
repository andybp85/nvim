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
    call dein#add('Valloric/YouCompleteMe', {'build': './install.py --js-completer --clang-completer'}) " {{{{
        let g:ycm_global_ycm_extra_conf = '~/.config/nvim/repos/github.com/Valloric/YouCompleteMe/.ycm_extra_conf.py'
        " let g:ycm_server_python_interpreter = '~/.pyenv/versions/neovim/bin/python'
        " let g:ycm_python_binary_path = '~/.pyenv/versions/neovim/bin/python'

        " let g:ycm_python_binary_path = '~/.pyenv/versions/3.6.2/bin/python'
        " let g:ycm_server_python_interpreter = '~/.pyenv/versions/3.6.2/bin/python'
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_seed_identifiers_with_syntax = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_semantic_triggers = {'haskell' : ['.']}
    " }}}}
    call dein#add('w0rp/ale') " new hotness for linting
    call dein#add('kien/rainbow_parentheses.vim') " matfching parens in dif colors
    call dein#add('majutsushi/tagbar') " {{{{
            let g:tagbar_width = 30
            let g:tagbar_show_linenumbers = 1
            nmap <leader>T :TagbarToggle<CR>
        " }}}}
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
        call dein#add('bigfish/vim-js-context-coloring', { 'build': 'npm install' })
        call dein#add('pangloss/vim-javascript')
        call dein#add('mxw/vim-jsx')
        call dein#add('leafgarland/typescript-vim')
        call dein#add('HerringtonDarkholme/yats.vim')
        call dein#add('Shougo/vimproc.vim', {'build': 'make'})
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
        call dein#add('parsonsmatt/intero-neovim') " {{{{{
            let g:intero_use_neomake = 0
        " }}}}}
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

" Modeline
" vim:foldmethod=marker:foldlevel=0
