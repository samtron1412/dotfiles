" Toggle textwidth
function! vimrc#ToggleTextwidth()
  if &textwidth > 0
    set textwidth=0
  else
    set textwidth=72
  endif
endfunction

" Zoom / Restore window.
function! vimrc#ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
