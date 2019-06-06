" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set nrformats=                  "Treat all numerals as decimal
set mouse=a                     "Support mouse actions
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8              "Set vim use utf-8
set fileencoding=utf-8          "Force vim overwrite file encoding to
                                "utf-8
set textwidth=72                "Set text width is 72 columns
set colorcolumn=+1              "Set color columns is textwidth
set nowrap                      "Set no soft wrapping
set number
set background=dark

" Status line at the bottom
set ruler
set laststatus=2

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

syntax on           " turn on syntax highlighting

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
filetype indent plugin on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set cursorline

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=4       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

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

xnoremap p pgvy		"paste and recopy

nmap oo o<Esc>k 	"insert new line after current line
nmap OO O<Esc>j 	"insert new line before current line

"======== Moving lines up or down =====================
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

"======== Moving in the buffer list =====================
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"= Easy Expansion of the Active File Directory
let mapleader=','
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


"= Searching files
set path=**
map <leader>f :find
map <leader>sf :sfind
map <leader>vf :vertical sfind

"= Set the color of the column marker is dark gray.
highlight ColorColumn ctermbg=8

"= Toggle hard wrapping by textwidth
map <C-B> <Esc>:call ToggleTextwidth()<CR>
function! ToggleTextwidth()
  if &textwidth > 0
    set textwidth=0
  else
    set textwidth=72
  endif
endfunction
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap list

"==== vim-plug ===="

"= Automatic installation"
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

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'

" Initialize plugin system
call plug#end()

" Reload .vimrc and :PlugInstall to install plugins.


"= Fuzzy Finder"
nnoremap <C-p> :<C-u>FZF<CR>

let g:gruvbox_italic=1
colorscheme gruvbox

" Change the cursor from box to line in the insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Easy Align key binding
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Spell checking
autocmd FileType latex,tex,md,markdown setlocal spell spelllang=en_us
