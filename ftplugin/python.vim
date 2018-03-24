let g:pymode_lint_todo_symbol = ''
let g:pymode_lint_comment_symbol = ''
let g:pymode_lint_visual_symbol = ''
let g:pymode_lint_error_symbol = ''
let g:pymode_lint_info_symbol = ''
let g:pymode_lint_pyflakes_symbol = ''
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', 'pep257']
let g:pymode_virtualenv = 1
let g:pymode_rope_regenerate_on_write = 0
" let g:pymode_python = 'python3'
" auto pep8 lint
nmap <silent> <leader>lp :PymodeLintAuto<CR>
" make python prog
:set makeprg=python\ %
