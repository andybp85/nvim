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

" ag.vim {{{{
    nnoremap <leader>a :Ag<space>
" }}}}

" Modeline
" vim:foldmethod=marker:foldlevel=0
