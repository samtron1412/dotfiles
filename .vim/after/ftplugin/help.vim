nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
let b:undo_ftplugin .= "| nunmap <buffer> <CR>"
    \ . "| nunmap <buffer> <BS>"
    \ . "| nunmap <buffer> o"
    \ . "| nunmap <buffer> O"
    \ . "| nunmap <buffer> s"
    \ . "| nunmap <buffer> S"
