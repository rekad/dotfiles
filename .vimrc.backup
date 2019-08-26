call plug#begin('~/.vim/plugged')

"colors
Plug 'chriskempson/base16-vim'

"general
Plug 'scrooloose/nerdtree'

"searching
Plug '/usr/local/opt/fzf' "requires homebrew install
Plug 'junegunn/fzf.vim'

"javascript
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
Plug 'mattn/emmet-vim'

"golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
"GIT
Plug 'tpope/vim-fugitive'
"Syntax checking
Plug 'w0rp/ale'

"Distraction free writing
Plug 'junegunn/goyo.vim'

"Haskell
Plug 'neovimhaskell/haskell-vim' "syntax highlighting
Plug 'alx741/vim-hindent' "autoindent (requires stack install hindent)

Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-surround'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'Valloric/YouCompleteMe'


"python
"Autoformatting
Plug 'ambv/black'
"Plug 'davidhalter/jedi-vim'
"Plug 'mindriot101/vim-yapf'

"IDE/Autocomplete
Plug 'Valloric/YouCompleteMe'

call plug#end()


"https://github.com/chriskempson/base16-iterm2/blob/master/base16-tomorrownight.dark.itermcolors
"https://github.com/chriskempson/base16-vim
colorscheme base16-tomorrow-night

:imap jj <Esc>
:set number

noremap <Leader>s :w<CR>

syntax on
filetype plugin indent on

"tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

set encoding=utf8
set laststatus=2
set autoread
set clipboard=unnamed
set autowrite

set wildmenu
set wildignore+=*/node_modules/*
set showmatch

set incsearch

nnoremap <C-p> :Files<CR>
nnoremap <C-B> :Buffers<CR>

"Split Settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"NERDTree
noremap <Leader><Tab> :NERDTreeToggle<CR>
noremap <Leader>x :bp\|bd #<CR>
noremap <Leader>f :NERDTreeFind<CR>
