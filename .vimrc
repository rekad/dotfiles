" inspiration: https://gist.github.com/synasius/5cdc75c1c8171732c817
call plug#begin('~/.vim/plugged')

"colors
Plug 'chriskempson/base16-vim'

"file navigation
Plug 'scrooloose/nerdtree'

"searching
Plug '/usr/local/opt/fzf' "requires homebrew install
Plug 'junegunn/fzf.vim'

"javascript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx'
"Plug 'mattn/emmet-vim'

"golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
"GIT
"Plug 'tpope/vim-fugitive'
"Syntax checking
"Plug 'w0rp/ale'

"Distraction free writing
"Plug 'junegunn/goyo.vim'

"Haskell
"Plug 'neovimhaskell/haskell-vim' "syntax highlighting
"Plug 'alx741/vim-hindent' "autoindent (requires stack install hindent)

"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-surround'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'Valloric/YouCompleteMe'


"python
"Autoformatting
Plug 'ambv/black'
Plug 'fisadev/vim-isort'
"Plug 'davidhalter/jedi-vim'
"Plug 'mindriot101/vim-yapf'

"IDE/Autocomplete
"Plug 'Valloric/YouCompleteMe'

call plug#end()


"Colors
"https://github.com/korzhyk/base16-terminal-app/blob/master/base16-tomorrow.dark.terminal
"https://github.com/chriskempson/base16-vim
colorscheme base16-tomorrow
syntax on

" Appearance
set number
set nohlsearch

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" Clipboard
set clipboard+=unnamedplus

" Search
set ignorecase
set smartcase

" NERDTree
let NERDTreeShowHidden=1

"tab settings
"set expandtab
"set shiftwidth=2
"set softtabstop=2

"set encoding=utf8
"set laststatus=2
"set autoread
"set clipboard=unnamed
"set autowrite

"set wildmenu
"set wildignore+=*/node_modules/*
"set showmatch

"set incsearch


"Custom Mappings

"fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-B> :Buffers<CR>

"Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"set splitbelow
"set splitright

"noremap <Leader>s :w<CR>

imap jj <Esc>
"NERDTree
noremap <Leader><Tab> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
