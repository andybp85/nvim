let g:javascript_enable_domhtmlcss           = 0  " Turn off the DOM2, HTML, and CSS
let g:javascript_plugin_flow                 = 1
" let g:javascript_conceal                   = 0
" let g:javascript_conceal_function          = "ƒ"
" let g:javascript_conceal_null              = "ø"
" let g:javascript_conceal_this              = "@"
" let g:javascript_conceal_return            = "⇚"
" let g:javascript_conceal_undefined         = "¿"
" let g:javascript_conceal_NaN               = "ℕ"
" let g:javascript_conceal_prototype         = "¶"
" let g:javascript_conceal_static            = "•"
" let g:javascript_conceal_super             = "Ω"
" let g:javascript_conceal_arrow_function    = "⇒"
let g:js_context_colors_enabled              = 0
let g:js_context_colors_usemaps              = 0
let g:js_context_colors_fold                 = 1
let g:js_context_colors_foldlevel            = 2
let g:js_context_colors_block_scope_with_let = 1
let g:js_context_colors_jsx                  = 1
let g:js_context_colors_allow_jsx_syntax     = 1
let g:js_context_colors_show_error_message   = 1
nmap <silent> <leader>c :JSContextColorToggle<CR>
nmap <silent> <leader>rc :JSContextColorUpdate<CR>
