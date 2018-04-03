call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"https://github.com/chriskempson/base16-iterm2/blob/master/base16-tomorrownight.dark.itermcolors
"https://github.com/chriskempson/base16-vim
colorscheme base16-tomorrow-night

:imap jj <Esc>
:set number

syntax on
set showmatch
set encoding=utf8
"set noswapfile
set laststatus=2
set autoread
set clipboard=unnamed
set autowrite

set wildmenu
set showmatch

set incsearch
"set hlsearch

"CtrlP settings
let g:ctrlp_show_hidden = 1

"Split Settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


"Helpers for easy access to file browser
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

"Go Settings
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"Syntax Highlighting
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_extra_types = 1
