
" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Enable syntax highlighting
syntax on
set background=dark

" Enable line numbering
set number
set numberwidth=5

" Set up our tabs
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Togge paste mode to prevent indenting when pasting
set pastetoggle=<F2>

" We want our encoding to be utf-8
set encoding=utf-8 nobomb

" Allow backspace in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=1000

" Enable wildmenu
set wildmenu

" 1st tab: complete longest common command, 2nd tab: show all completions
set wildmode=list:longest,full

set showmode     " always show what mode we're currently editing in
set ruler        " Always show current positions along the bottom
set showmatch    " Show matching brackets
set nowrap       " Turn off line wrapping
set ignorecase   " Case insensitive matching
set smartcase    " Smart case matching
set incsearch    " Incremential search
set showcmd      " Show (partial) command in the status line
set nobackup     " We don't want a backup file
set noswapfile   " No need for a swap file
set hidden       " Change buffer without saving
set hlsearch     " Highlight search terms
set incsearch    " Show search matches as you type

set scrolloff=8       " Start scrolling 8 lines from top/bottom margins
set sidescrolloff=15  " Start scrolling 15 lines from left/right margins
set sidescroll=1

nnoremap ; :

"calls sudo and asks for password if necessary
cmap w!! %!sudo tee > /dev/null %

if has("autocmd")
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif
