" Custom the colorscheme
function! vimrc#MyHighlights() abort
  " Set dark gray for the collumn marker
  highlight ColorColumn ctermbg=8
endfunction

" vim-gitgutter's functions
" Cycle through hunks in all buffers
function! vimrc#NextHunkAllBuffers() abort
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! vimrc#PrevHunkAllBuffers() abort
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction


" The winsaveview() will save the current view, which includes the
" cursor position, folds, jumps, etc. The winrestview() at the end will
" restore this from the saved variable.
" The :keeppatterns prevents the \s\+$ pattern from being added to the
" search history.
function! vimrc#TrimWhitespace() abort
  if !&readonly
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun


" Toggle textwidth
function! vimrc#ToggleTextwidth() abort
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


" Create non-existent directory
function vimrc#MkNonExDir(file, buf) abort
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
