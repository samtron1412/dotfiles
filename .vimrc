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


"""" Utility
"""" Enhance or change behavior of core vim

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

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" Hyperfocus-writing: dim light
Plug 'junegunn/limelight.vim'

" Range, pattern, and substitute preview for Vim
Plug 'markonm/traces.vim'

"Plug 'Valloric/YouCompleteMe'
"Plug 'jiangmiao/auto-pairs'
"Plug 'junegunn/vim-easy-align'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-entire'


"""" LaTeX

"Plug 'lervag/vimtex'


"""" Markdown / Writing

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
"Plug 'JamshedVesuna/vim-markdown-preview'  " Minimalist

" Full feature preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }


"""" Programming Support

Plug 'tpope/vim-commentary'


"""" Git

" Git wrapper in vim
Plug 'tpope/vim-fugitive'

" GitHub support
Plug 'tpope/vim-rhubarb'

" Helping making vim plugins
Plug 'tpope/vim-scriptease'

" A git commit browser
Plug 'junegunn/gv.vim'

" Shows git diff in the gutter (sign column)
Plug 'airblade/vim-gitgutter'


"""" Theme / Interface
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
set mouse=a                     "Support mouse actions
set autoread                    "Automatically reload buffers

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
set background=dark     "Use the dark background
set termguicolors       "Support 24-bit colors in terminals

" Set dark gray for the collumn marker
highlight ColorColumn ctermbg=8


" Search

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set synmaxcol=200   " max # of cols to be highlighted


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

set foldmethod=manual
set foldnestmax=6       "deepest fold levels
set nofoldenable        "dont fold by default


" Change the cursor from box to line in the insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"



""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""

"""" gruvbox configuration

let g:gruvbox_italic=1
colorscheme gruvbox     " Load colorscheme after vim-plug and gruvbox configuration


"""" vim-markdown configuration

" code blocks
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['csharp=cs']

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format


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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"  " use <Tab> trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"


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

" Spell checking
autocmd FileType latex,tex,md,markdown,vim setlocal spell spelllang=en_us

" Integrate Goyo and LimeLight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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

" Zoom and restore window
nnoremap <silent> <Leader>z <Esc>:call vimrc#ZoomToggle()<CR>

" Set paste toggle mapping
set pastetoggle=<F2>

" Disable Backspace and Delete keys
inoremap <BS> <Nop>
inoremap <Del> <Nop>

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

" Command history completion in the command line
cmap <C-p> <Up>
cmap <C-n> <Down>

" Correct spelling mistakes while typing
" <C-g>u: inset an undo break
" <Esc>[s: go to the previous spelling error
" 1z=: replace the error by the first suggestion
" `]: move to the last insert position
imap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Formatting the current paragraph (or selection)
vmap ff gq
nmap ff gqap

" paste and recopy
xmap p pgvy

" Paste in the next line
nnoremap <Leader>p o<Esc>p

" Paste in the previous line
nnoremap <Leader>P O<Esc>p

" diffupdate
nmap du :diffupdate<CR>

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

nmap <A-j> :m .+1<CR>==
nmap <A-k> :m .-2<CR>==
imap <A-j> <Esc>:m .+1<CR>==gi
imap <A-k> <Esc>:m .-2<CR>==gi
vmap <A-j> :m '>+1<CR>gv=gv
vmap <A-k> :m '<-2<CR>gv=gv

" Moving in the buffer list
nmap <silent> [b :bprevious<CR>
nmap <silent> ]b :bnext<CR>
nmap <silent> [B :bfirst<CR>
nmap <silent> ]B :blast<CR>
nmap <BS> <C-^>

" Clear highlight searches when press escape
nmap \c :noh<CR><Esc>

"= Toggle hard wrapping by textwidth
nmap \\ <Esc>:call vimrc#ToggleTextwidth()<CR>

" Easy Expansion of the Active File Directory
" Add the path of the current directory to the path of the file
let mapleader=','
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%



""""""""""""""""""""""""""""
" Plugin Mappings
""""""""""""""""""""""""""""

"""" fzf mapping

nmap <S-T> :Buffers<CR>

" Search file names
nmap <C-p> :Files<CR>

" Search file content
nmap <Leader>f :Find<Space>

" Search lines
nmap <Leader>s :BLines<CR>


"""" easy-align mapping

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""" markdown-preview.nvim mapping

nmap <Leader>mp <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop


"""" goyo mapping
nmap <Leader>d :Goyo<CR>


"""" git-gutter mapping

" This mapping also works with vimdiff
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Update the gutter
nmap <Leader>G :GitGutter<CR>


"""" vim-fugitive mapping
" Using cmdline for other tasks: move, delete, stash, push, pull

" Add all files
nmap <Leader>ga :Git add .<CR>

nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>

" Commit after adding
nmap <Leader>gC :Gcommit -v<CR>

" Commit after adding without invoking an editor
nmap <Leader>gc :Gcommit -m ""<Left>

" Add the file then commit it
" Take advantage of autocomplete in writing commit message
" Hit Ctrl-n to autocomplete the word
nmap <Leader>gG :Gcommit % -v<CR>

" Commit without invoking an editor
nmap <Leader>gg :Gcommit % -m ""<Left>

" Stage the current hunk and commit it
nmap <Leader>gH ,hs,gC

" Stage the current hunk and commit it without invoking an editor
nmap <Leader>gh ,hs,gc

nmap <Leader>gd :Gdiff<CR>

" Edit a fugitive-object, e.g. :% is the current file in the git index
" :h fugitive-object to learn more
" This map is to edit the current file in the git index
nmap <Leader>ge :Gedit<CR>

" Similar to git-checkout on a work tree file
nmap <Leader>gr :Gread<CR>

" Similar to git-add on a work tree file
nmap <Leader>gw :Gwrite<CR>

" Load this file's commit history into the quickfix list
" :copen to open the quickfix list
nmap <Leader>gl :Glog -- %<CR><CR>:copen<CR>

" List all commit history
nmap <Leader>gL :exe ':!cd ' . expand('%:p:h') . '; git lap'<CR>

" Rename the file, the new location is relative to the current file path
nmap <Leader>gm :Gmove<Space>

" Delete the file
nmap <Leader>gM :Gremove<CR>

nmap <Leader>gp :Gpush<CR>
nmap <Leader>gL :Gpull<CR>
