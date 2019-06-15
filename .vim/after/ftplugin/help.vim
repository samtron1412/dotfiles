" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
let b:undo_ftplugin = "nunmap <buffer> <CR>"
    \ . "| nunmap <buffer> <BS>"
    \ . "| nunmap <buffer> o"
    \ . "| nunmap <buffer> O"
    \ . "| nunmap <buffer> s"
    \ . "| nunmap <buffer> S"
