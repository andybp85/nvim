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
    nnoremap <leader>yg :YcmCompleter GoTo<CR>
    nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
" }}}}

" Tbone {{{
    nnoremap <leader>r :Twrite<CR>
" }}}

" custom mappings {{{{
    " set pastetoggle=<leader>pp

    " whenever you type % you jump to the matching object, and you visually select all the text in between
    noremap % v%

    " add sudo with :w!!
    cmap w!! w !sudo tee % >/dev/null

    " smart insert colon
    inoremap <leader>; <esc>A;
" }}}}

" indent guides {{{{
    nmap <silent> <leader>n :IndentGuidesToggle<CR>
" }}}}

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

" Modeline
" vim:foldmethod=marker:foldlevel=0
