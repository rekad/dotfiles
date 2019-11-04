" inspiration: https://gist.github.com/synasius/5cdc75c1c8171732c817
"
"PLUGINS
call plug#begin('~/.vim/plugged')

"COLORS
"https://github.com/korzhyk/base16-terminal-app/blob/master/base16-tomorrow.dark.terminal
"https://github.com/chriskempson/base16-vim
Plug 'chriskempson/base16-vim'
syntax on

"FILE NAVIGATION
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
noremap <Leader><Tab> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
Plug '/usr/local/opt/fzf' "requires homebrew install
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-B> :Buffers<CR>

"LINTING
Plug 'dense-analysis/ale'
let g:ale_set_highlights=0

"EDITORCONFIG
Plug 'editorconfig/editorconfig-vim'

"JAVASCRIPT
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx'

"PYTHON
Plug 'ambv/black'


"MISCELLANEOUS
Plug 'tpope/vim-surround'


call plug#end()


" Appearance
colorscheme base16-tomorrow
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

" Makes :substitute interactive
set inccommand=split

" Search
set ignorecase
set smartcase

"Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set relativenumber

"Snippets
nnoremap \js :-1read $HOME/.config/nvim/.react-component.js<CR>


