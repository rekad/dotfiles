call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }

Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'

Plug 'davidhalter/jedi-vim'
Plug 'mindriot101/vim-yapf'
call plug#end()

"https://github.com/chriskempson/base16-iterm2/blob/master/base16-tomorrownight.dark.itermcolors
"https://github.com/chriskempson/base16-vim
colorscheme base16-tomorrow-night

:imap jj <Esc>
:set number

noremap <Leader>s :w<CR>

syntax on
set ts=4 sw=4
set showmatch
set encoding=utf8
"set noswapfile
set laststatus=2
set autoread
set clipboard=unnamed
set autowrite

set wildmenu
set wildignore+=*/node_modules/*
set showmatch

set incsearch
"set hlsearch

"buftabline settings
let g:buftabline_indicators = 1 
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

"CtrlP settings
let g:ctrlp_show_hidden = 1

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

