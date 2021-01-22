""""""""""""""""""""""""""""
" Son Tran Vim Configuration
""""""""""""""""""""""""""""

" Set Python 3 as the default Python for Vim
set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/Current
set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/Current/Python

""""""""""""""""""""""""""""
" vim-plug: plugins
""""""""""""""""""""""""""""

" Automatically install vim-plug in a new system
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes


"""" Utility
"""" Enhance or change behavior of core vim

" vim-orgmode
Plug 'jceb/vim-orgmode'

" Support FocusGained, FocusLost in tmux iterm2
Plug 'tmux-plugins/vim-tmux-focus-events'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Remaps '.' in a way that plugins can use it
Plug 'tpope/vim-repeat'

" Add, change, delete surrounding pairs
Plug 'tpope/vim-surround'

" Readline style insertion
Plug 'tpope/vim-rsi'

" Helping making vim plugins
Plug 'tpope/vim-scriptease'

" Complementary pairs of mappings
Plug 'tpope/vim-unimpaired'

" Session managers
Plug 'tpope/vim-obsession'

" Enhance text objects
Plug 'wellle/targets.vim'

" Enhance matchit
Plug 'andymass/vim-matchup'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" Hyperfocus-writing: dim light
Plug 'junegunn/limelight.vim'

" Range, pattern, and substitute preview for Vim
Plug 'markonm/traces.vim'

" Jump to a position on the screen by two keys
Plug 'justinmk/vim-sneak'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Alignment plugin
Plug 'junegunn/vim-easy-align'


"""" LaTeX

Plug 'lervag/vimtex'


"""" Markdown

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
"Plug 'JamshedVesuna/vim-markdown-preview'  " Minimalist

" Full feature preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Generate TOC
Plug 'mzlogin/vim-markdown-toc'


"""" Programming Support

" Working with comments
Plug 'tpope/vim-commentary'

" Working with ctags
" Plug 'ludovicchabant/vim-gutentags'

" Working with tests and build systems
Plug 'tpope/vim-dispatch'

" Syntax checking
Plug 'w0rp/ale'


"""" Git

" Git wrapper in vim
Plug 'tpope/vim-fugitive'

" GitHub support
Plug 'tpope/vim-rhubarb'

" A git commit browser
Plug 'junegunn/gv.vim'

" Shows git diff in the gutter (sign column)
Plug 'airblade/vim-gitgutter'


"""" Theme / Interface
Plug 'morhetz/gruvbox'


" Initialize plugin system
call plug#end()

" Reload .vimrc and :PlugInstall to install plugins.


"""" Manually load plugins
runtime! ftplugin/man.vim



""""""""""""""""""""""""""""
" Vim Configuration
""""""""""""""""""""""""""""

filetype indent plugin on
set encoding=utf-8          "Set vim use utf-8
set fileencoding=utf-8      "Force vim overwrite file encoding to utf-8
set history=1000            "Store lots of :cmdline history
set nrformats=              "Treat all numerals as decimal
set mouse=a                 "Support mouse actions
set autoread                "Automatically reload buffers
set completeopt=menuone,longest,preview
set spell spelllang=en_us   "Enable spell check
syntax spell toplevel       "Spell check even for undefined groups
set timeout ttimeoutlen=50
set sessionoptions-=help

" Set macmeta for MacVim
if has('gui_macvim')
  set macmeta
endif


" Save buffers, the last 100 files, etc.
set viminfo=%20,'100,<1000,h,!

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right

" Vim with default settings does not allow easy switching between
" multiple files in the same editor window. Users can use multiple split
" windows or multiple tab pages to edit multiple files, but it is still
" best to enable an option to allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the
" same window and switch from an unsaved buffer without saving it first.
" Also, it allows you to keep an undo history for multiple files when
" re-using the same window in this way. Note that using persistent undo
" also lets you undo in multiple files even in the same window, but is
" less efficient and is actually designed for keeping undo history after
" closing Vim entirely. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden


" Completion

set wildignorecase      "enable ignore case
set wildmenu            "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest,list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set showmatch           " highlight matching [{()}]


"""" Theme / Interface

syntax on               " turn on syntax highlighting
set visualbell          "No sounds
set nowrap              "Set no soft wrapping
set showcmd             "Show incomplete cmds down the bottom
set showmode            "Show current mode down the bottom
set textwidth=72        "Set text width is 72 columns (hard wrap)
set colorcolumn=+1      "Set color columns is textwidth + 1
set relativenumber              "Show line numbers
set termguicolors       "Support 24-bit colors in terminals
set scrolloff=3         "Keep lines from the top and bottom

" Custom the colorscheme
augroup MyColors
  autocmd!
  autocmd ColorScheme * call vimrc#MyHighlights()
augroup END

" Display tabs and trailing spaces visually
set list listchars=eol:¬,tab:▸-,trail:·,space:·

" :h fo-table to learn more about options
if has('nvim') || (v:version < 801)
  set formatoptions=tcrqnlj
else
  set formatoptions=tcrqnljp
endif

" Search

set incsearch       " Find the next match as we type the search
if has('nvim')
  set nohlsearch
endif
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set synmaxcol=500   " max # of cols to be highlighted

" Enhance grep by using ag
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" Indentation and Tabs
" Convert existing tabs to spaces by :retab

set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab


"""" Statusline
set laststatus=2                "Always show the status line at the bottom
set statusline=
set statusline+=%#PmenuSel#     "Highlight the git branch
set statusline+=%{FugitiveStatusline()} "Git branch of this file
set statusline+=%{ObsessionStatus()}    "Indicator for sessions: 'S': stop, '$': running
" set statusline+=%{gutentags#statusline('[',']')}
set statusline+=%#LineNr#       "Erase highlight for other parts
set statusline+=\ %f            "A whitespace followed by file path
set statusline+=%m              "Modified flag
set statusline+=%r              "Read only flag
set statusline+=%w              "Preview window flag
set statusline+=%=              "Separation point between left and right items
set statusline+=\ %y            "A whitespace followed by file type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} "File encoding
set statusline+=\ [%{&fileformat}]   "File format: unix, dos, mac
set statusline+=\ %p%%          "Percentage through file in lines
set statusline+=\ %l:%c         "Line and column numbers


" Folding

" set foldmethod=indent
" set foldnestmax=6       "deepest fold levels
" set nofoldenable        "don't fold by default
" set conceallevel=0      "don't conceal text
set conceallevel=2      "standard concealing


" Change the cursor from box to line in the insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" Use space as global leader key
let g:mapleader = "\<Space>"

" Use back slash key as local leader key
let maplocalleader = "\\"

" Default to not read-only in vimdiff
set noro


""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""

"""" vimtex configuration

let g:tex_flavor='latex'
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1
let g:vimtex_view_method = 'skim'


"""" ale configuration

let g:ale_enabled = 0   " Disable ALE at beginning


"""" vim-gutentags configuration

" Activate Gutentags when opening a file that’s somewhere under a
" directory that contains a Makefile file or folder.
" let g:gutentags_project_root = ['Makefile']


"""" fzf.vim configuration

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }


"""" netrw

" Close the netrw after opening files
let g:netrw_fastbrowse=0

"""" gruvbox configuration

let g:gruvbox_italic=1
colorscheme gruvbox     " Load colorscheme after vim-plug and gruvbox configuration
set background=dark     " Using dark mode for grub-box


"""" vim-markdown configuration

" Follow named anchors
let g:vim_markdown_follow_anchor = 1

" Auto-write when following links
let g:vim_markdown_autowrite = 1

" Disable auto add bullet points because when reformatting a long line,
" it automatically add bullets => have to delete them later => more work
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 2

" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1

" code blocks
" let g:vim_markdown_conceal_code_blocks = 0

" disable header folding
" let g:vim_markdown_folding_disabled = 1

" do not use conceal feature
" let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:vim_markdown_math = 1

" support front matter of various format
" let g:vim_markdown_frontmatter = 1  " for YAML format
" let g:vim_markdown_toml_frontmatter = 1  " for TOML format
" let g:vim_markdown_json_frontmatter = 1  " for JSON format


"""" vim-markdown-preview configuration

"let vim_markdown_preview_hotkey='<A-p>'
"let vim_markdown_preview_browser='Google Chrome'
"let vim_markdown_preview_github=1


"""" markdown-preview.nvim configuration

"Refresh when save the buffer or leave from insert mode
let g:mkdp_refresh_slow = 1
"let g:mkdp_markdown_css = '~/repo/code/misc/github-markdown.css'

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0


"""" ultisnips configuration

" Trigger configuration.
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-Tab>"
let g:UltiSnipsEnableSnipMate=0


"""" limelight configuration

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'



""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""

"""" Autocmd

augroup vimrc
  au!

  " Automatically remove trailing spaces
  autocmd BufWritePre * :call vimrc#TrimWhitespace()

  " Create non-existent directory
  autocmd BufWritePre * :call vimrc#MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Integrate Goyo and LimeLight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"""" Custom commands

" :Find <pattern>
" Find the pattern in file contents
" --fixed-strings: Search term as a literal string (no need to escape special characters)
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --fixed-strings --hidden --follow --glob "!git/*" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Enable and disable soft wrap
command! -nargs=* Wrap set wrap linebreak
command! -nargs=* Nowrap set nowrap

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


" Log all autocmds that are triggered by vim to the file
" /tmp/vim_log_autocommands
" Usage: `:LogAutocmds`
command! LogAutocmds call log#log_autocmds_toggle()

" Redirect ex command outputs to a scratch window
" Usage: `:Redir highlight`
command! -nargs=1 -complete=command -bar -range Redir silent call redir#Redir(<q-args>, <range>, <line1>, <line2>)

""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""

"""" useful mappings

" Paste multiple times
xnoremap p pgvy


"""" omni completion mappings

" Terminals send a confused sequence to Vim, so <C-Space> is interpreted
" as <C-@>
inoremap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>


"""" ctags

" Ctrl+\ - Open the definition in a new tab
" Alt+] - Open the definition in a vertical split
" nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"""" Emacs-style editing on the command-line
" start of line
cnoremap <C-A> <Home>
" back one character
cnoremap <C-B> <Left>
" delete character under cursor
cnoremap <C-D> <Del>
" end of line
cnoremap <C-E> <End>
" forward one character
cnoremap <C-F> <Right>
" recall newer command-line
cnoremap <C-N> <Down>
" recall previous (older) command-line
cnoremap <C-P> <Up>


" Window navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Update syntax highlighting when it breaks
nnoremap <Leader>u :syntax sync fromstart<CR>

" Zoom and restore window
nnoremap <silent> <Leader>z <Esc>:call vimrc#ZoomToggle()<CR>

" Set paste toggle mapping
set pastetoggle=<F2>

" Disable Backspace and Delete keys
" cnoremap <BS> <Nop>
" inoremap <Del> <Nop>

" Disable arrow keys in insert mode
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Correct spelling mistakes while typing
"
" <C-g>u: insert an undo break
" <Esc>[s: go to the previous spelling error
" 1z=: replace the error by the first suggestion
" `]: move to the last insert position
" a: enter insert mode at append position
" <C-g>u: insert another undo break
inoremap <A-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Add the word to dictionary
inoremap <A-d> <C-g>u<Esc>[s1zg`]a<C-g>u

" Formatting the current paragraph (or selection)
vnoremap ff gq
nnoremap ff gqap

" diffupdate
nnoremap du :diffupdate<CR>

"""" Moving lines up or down

" Fix META key if needed
if !has('nvim')
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Edit the alternate file
nnoremap <BS> <C-^>

" Clear highlight searches when press escape
nnoremap \c :noh<CR><Esc>

"= Toggle hard wrapping by textwidth
nnoremap \\ <Esc>:call vimrc#ToggleTextwidth()<CR>

" Easy Expansion of the Active File Directory
" Add the path of the current directory to the path of the file
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
nmap <Leader>ew :e %%
nmap <Leader>es :sp %%
nmap <Leader>ev :vsp %%
nmap <Leader>et :tabe %%



""""""""""""""""""""""""""""
" Plugin Mappings
""""""""""""""""""""""""""""

"""" ale mapping

nmap <Leader>at <Plug>(ale_toggle)
nmap <Leader>aT <Plug>(ale_toggle_buffer)


"""" vim-markdown-toc mapping

nnoremap <Leader>mT :GenTocGFM<CR>
" markdown undo toc
nnoremap <Leader>mut :RemoveToc<CR>


"""" fzf mapping

nnoremap <Leader>b :Buffers<CR>

" Search file names
nnoremap <C-p> :Files<CR>

" Search file content
nnoremap <Leader>f :Find<CR>

" Search lines

nnoremap <Leader>s :BLines<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-rg)
imap <c-x><c-l> <plug>(fzf-complete-line)


"""" easy-align mapping

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""" vim-markdown mapping
nnoremap <Leader>mf :TableFormat<CR>
xnoremap <Leader>mf :TableFormat<CR>
nnoremap <Leader>mt :Toc<CR>
xnoremap <Leader>mi :HeaderIncrease<CR>
xnoremap <Leader>md :HeaderDecrease<CR>
nnoremap <Leader>mi I#<Esc>
nnoremap <Leader>md 0x


"""" markdown-preview.nvim mapping

nmap <Leader>mp <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop


"""" goyo mapping
nnoremap <Leader>d :Goyo<CR>


"""" git-gutter mapping

" This mapping also works with vimdiff
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Update the gutter
nnoremap <Leader>G :GitGutter<CR>

" Toggle folding for all unchanged lines
nnoremap <Leader>gf :GitGutterFold<CR>

" Hunk text objects
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Cycle through hunks in all buffers
nnoremap ]H :call vimrc#NextHunkAllBuffers()<CR>
nnoremap [H :call vimrc#PrevHunkAllBuffers()<CR>


"""" vim-fugitive mapping
" Using cmdline for other tasks: move, delete, stash, push, pull

" Add all files
nnoremap <Leader>ga :Git add .<CR>

nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Commit after adding
nnoremap <Leader>gC :Gcommit -v<CR>

" Commit after adding without invoking an editor
nnoremap <Leader>gc :Gcommit -m ""<Left>

" Add the file then commit it
" Take advantage of autocomplete in writing commit message
" Hit Ctrl-n to autocomplete the word
nnoremap <Leader>gG :Gcommit % -v<CR>

" Commit without invoking an editor
nnoremap <Leader>gg :Gcommit % -m ""<Left>

" Stage the current hunk and commit it
nmap <special> <Leader>gH <Leader>hs<Leader>gC

" Stage the current hunk and commit it without invoking an editor
nmap <special> <Leader>gh <Leader>hs<Leader>gc

nnoremap <Leader>gd :Gdiff<CR>

" Edit a fugitive-object, e.g. :% is the current file in the git index
" :h fugitive-object to learn more
" This map is to edit the current file in the git index
nnoremap <Leader>ge :Gedit<CR>

" Similar to git-checkout on a work tree file
nnoremap <Leader>gr :Gread<CR>

" Similar to git-add on a work tree file
nnoremap <Leader>gw :Gwrite<CR>

" Load this file's commit history into the quickfix list
" :copen to open the quickfix list
nnoremap <Leader>gv :GV!<CR>

" List all commit history
nnoremap <Leader>gV :GV<CR>

" List all revisions of this file
nnoremap <Leader>go :0Glog<CR>:copen<CR>

" Rename the file, the new location is relative to the current file path
nnoremap <Leader>gm :Gmove<Space>

" Delete the file
nnoremap <Leader>gM :Gremove<CR>

nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull<CR>

" Source or Edit vimrc
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>

" Close all buffers except the current buffer
nnoremap <Leader>w :%bd <bar> e#<CR>

" Close all buffers
nnoremap <Leader>W :%bd<CR>
