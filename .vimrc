:imap jj <Esc>
:set number

set showmatch
set encoding=utf8
"set noswapfile
set laststatus=2
set autoread

set wildmenu
set showmatch

set incsearch
"set hlsearch


let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 4
let g:netrw_winsize = 75

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'Ardakilic/vim-tomorrow-night-theme'

call plug#end()

colorscheme Tomorrow-Night
