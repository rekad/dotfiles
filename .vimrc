call plug#begin('~/.vim/plugged')
"colors
Plug 'chriskempson/base16-vim'

"searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
Plug 'mileszs/ack.vim'

"javascript
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
Plug 'mattn/emmet-vim'

"general
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'


"python
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

"tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

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
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

"ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack!
"search should not leak to shell
set shellpipe=>

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

