:imap jj <Esc>
:set number

set showmatch
set encoding=utf8
"set noswapfile
set laststatus=2
set autoread
set clipboard=unnamed

set wildmenu
set showmatch

set incsearch
"set hlsearch

"Split Settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
noremap <Leader><Tab> :call VexToggle(getcwd())<CR>
noremap <Leader>` :call VexToggle("")<CR>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1

fun! VexToggle(dir)
	if exists("t:vex_buf_nr")
		call VexClose()
	else
		call VexOpen(a:dir)
	endif
endf
fun! VexOpen(dir)
	let g:netrw_browse_split=4
	let vex_width = 25
	execute "Vexplore " . a:dir
	let t:vex_buf_nr = bufnr("%")
	wincmd H
	call VexSize(vex_width)
endf
fun! VexClose()
	let cur_win_nr = winnr()
	let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )
	1wincmd w
	close
	unlet t:vex_buf_nr
	execute (target_nr - 1) . "wincmd w"
	call NormalizeWidths()
endf
fun! VexSize(vex_width)
	execute "vertical resize" . a:vex_width
	set winfixwidth
	call NormalizeWidths()
endf
fun! NormalizeWidths()
	let eadir_pref = &eadirection
	set eadirection=hor
	set equalalways! equalalways!
	let &eadirection = eadir_pref
endf
augroup NetrwGroup
  autocmd! BufEnter * call NormalizeWidths()
augroup END

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'Ardakilic/vim-tomorrow-night-theme'

call plug#end()

colorscheme Tomorrow-Night
