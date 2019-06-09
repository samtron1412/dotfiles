""""""""""""""""""""""""""""
" Son Tran Vim Configuration
""""""""""""""""""""""""""""

"""" Init

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" This must be first, because it changes other options as a side effect.
set nocompatible


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

" Utility
" Enhance or change behavior of core vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
"Plug 'Shougo/neocomplete.vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'junegunn/vim-easy-align'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-entire'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Markdown / Writing


" Programming Support
"Plug 'tpope/vim-commentary'

" LaTeX
"Plug 'lervag/vimtex'

" Theme / Interface
Plug 'patstockwell/vim-monokai-tasty'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Reload .vimrc and :PlugInstall to install plugins.



""""""""""""""""""""""""""""
" Vim Configuration
""""""""""""""""""""""""""""

filetype indent plugin on
set encoding=utf-8              "Set vim use utf-8
set fileencoding=utf-8          "Force vim overwrite file encoding to utf-8
set history=1000                "Store lots of :cmdline history
set nrformats=                  "Treat all numerals as decimal
set backspace=indent,eol,start  "Allow backspace in insert mode
set mouse=a                     "Support mouse actions

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


" Scrolling

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15    "Side scrolling (horizontal)
set sidescroll=1


" Completion

set wildignorecase      "enable ignore case
set wildmenu            "enable ctrl-n and ctrl-p to scroll thru matches
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

colorscheme gruvbox     " Load colorscheme after vim-plug
syntax on               " turn on syntax highlighting
set visualbell          "No sounds
set nowrap              "Set no soft wrapping
set showcmd             "Show incomplete cmds down the bottom
set showmode            "Show current mode down the bottom
set textwidth=72        "Set text width is 72 columns (hard wrap)
set colorcolumn=+1      "Set color columns is textwidth + 1
set number              "Show line numbers
set background=dark     "Use the dark background

" Set dark gray for the collumn marker
highlight ColorColumn ctermbg=8


" Search

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" Indentation and Tabs
" Convert existing tabs to spaces by :retab

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=eol:¬,tab:▸-,trail:·,space:·
set cursorline


"""" Statusline
set ruler                       "Show line and collumn number of the cursor
set laststatus=2                "Always show the status line at the bottom
set statusline=
set statusline+=%#PmenuSel#     "Highlight the git branch
set statusline+=%{FugitiveStatusline()} "Git branch of this file
set statusline+=%#LineNr#       "Erase highlight for other parts
set statusline+=\ %f            "A whitespace followed by file path
set statusline+=%m              "Modified flag
set statusline+=%=              "Separation point between left and right items
set statusline+=\ %y            "A whitespace followed by file type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} "File encoding
set statusline+=\ [%{&fileformat}]   "File format: unix, dos, mac
set statusline+=\ %p%%          "Percentage through file in lines
set statusline+=\ %l:%c         "Line and column numbers


" Folding

"set foldmethod=indent   "fold based on indent
"set foldnestmax=6       "deepest fold levels
"set nofoldenable        "dont fold by default


" Change the cursor from box to line in the insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"



""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""

"""" gruvbox

let g:gruvbox_italic=1



""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""

"""" Autocmd

" Spell checking
autocmd FileType latex,tex,md,markdown setlocal spell spelllang=en_us

"Load the changes if cursor stop moving
autocmd CursorHold * checktime


"""" Custom commands

" :Find <pattern>
" Find the pattern in file contents
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


" Enable and disable soft wrap
command! -nargs=* Wrap set wrap linebreak
command! -nargs=* Nowrap set nowrap



""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""

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

set timeout ttimeoutlen=50

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Moving in the buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <BS> <C-^>
nnoremap <S-T> :Buffers<CR>


" Clear highlight searches when press escape
nnoremap \c :noh<CR><Esc>


"= Toggle hard wrapping by textwidth
map \\ <Esc>:call ToggleTextwidth()<CR>
function! ToggleTextwidth()
  if &textwidth > 0
    set textwidth=0
  else
    set textwidth=72
  endif
endfunction

" Search file names
nnoremap <C-p> :Files<CR>
map <CR> :Find 



""""""""""""""""""""""""""""
" Leader Mappings
""""""""""""""""""""""""""""

" Easy Expansion of the Active File Directory
" Add the path of the current directory to the path of the file
let mapleader=','
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%



""""""""""""""""""""""""""""
" Plugin Mappings
""""""""""""""""""""""""""""

"""" Easy Align key binding

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"paste and recopy
xnoremap p pgvy
