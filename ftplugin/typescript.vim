let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
nmap <buffer> <Leader>h : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_shortest_import_path = 1
let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
        \ 'e:enums:0:1',
        \ 'f:function:0:1',
        \ 't:typealias:0:1',
        \ 'M:Module:0:1',
        \ 'I:import:0:1',
        \ 'i:interface:0:1',
        \ 'C:class:0:1',
        \ 'm:method:0:1',
        \ 'p:property:0:1',
        \ 'v:variable:0:1',
        \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
\ }
