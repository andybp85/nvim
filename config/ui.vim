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

" Modeline
" vim:foldmethod=marker:foldlevel=0
