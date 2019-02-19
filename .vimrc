call plug#begin('~/.vim/plugged')
"colors
Plug 'chriskempson/base16-vim'

"general
Plug 'scrooloose/nerdtree'

"searching
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
Plug 'mileszs/ack.vim'

"javascript
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
Plug 'mattn/emmet-vim'

"golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
"Plug 'davidhalter/jedi-vim'
"Plug 'mindriot101/vim-yapf'

"Plug 'Valloric/YouCompleteMe'

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

"CtrlP settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore .git -g ""'
"endif
"let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
"requires brew install fd
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
nnoremap <C-b> :CtrlPBuffer<CR>

"search settings
"brew install the_silver_searcher
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
