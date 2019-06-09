function! vimrc#ToggleTextwidth()
  if &textwidth > 0
    set textwidth=0
  else
    set textwidth=72
  endif
endfunction
