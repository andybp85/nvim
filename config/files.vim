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

" Modeline
" vim:foldmethod=marker:foldlevel=0
