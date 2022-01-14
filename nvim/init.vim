call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'rafamadriz/neon'
" Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'


Plug 'nvim-lua/completion-nvim'

Plug 'hoob3rt/lualine.nvim'

Plug 'voldikss/vim-floaterm'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'alvarosevilla95/luatab.nvim'

Plug 'b3nj5m1n/kommentary'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'rmagatti/auto-session'
call plug#end()


" markdown
set conceallevel=2

" syntax highlighting
syntax enable

" \ is also still <leader>
let mapleader = " "


lua << EOF
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


opt.number = true           -- show line numbers
opt.relativenumber = true   -- relative line numbers
opt.expandtab = true        -- use spaces instead of tabs
opt.shiftwidth = 2          -- size of an indent
opt.tabstop = 2             -- number of spaces in a tab
opt.smartindent = true      -- insert indents automatically
opt.termguicolors = true    -- true color support

vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'

cmd 'colorscheme gruvbox'

map('', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('', '<leader>fo', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
map('', '<leader>fs', '<cmd>Telescope treesitter<cr>')
map('', '<leader>fr', '<cmd>Telescope lsp_references<cr>')
map('', '<leader>fe', '<cmd>Telescope oldfiles<cr>')



-- window switching
map('', '<c-h>', '<c-w>h')
map('', '<c-l>', '<c-w>l')
map('', '<c-j>', '<c-w>j')
map('', '<c-k>', '<c-w>k')

-- terminal
map('t', '<Esc>', '<c-\\><c-n>')
map('', '<leader>t', '<cmd>FloatermNew<cr>') --
map('', '<leader>dt', '<cmd>FloatermKill!<cr>') --

-- LSP setup
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true}

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  require'completion'.on_attach(client, bufnr)
end

require'lspconfig'.pyright.setup{
  on_attach = on_attach
}

EOF

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END


" trying out lua scripting
" command! Scratch lua require'tools'.makeScratch()
"

" completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c



" status line thingy
lua << EOF
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
 --     { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
 --    'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
--  extensions = {'fugitive'}
}
EOF



" hi ActiveWindow ctermbg=None ctermfg=None guibg=#21242b
" hi InactiveWindow ctermbg=darkgray ctermfg=gray guibg=#282c34
" set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
" 
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'
" 
"     " the label is made by MyTabLabel()
"     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
" 
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSep#ÓÇ∞'
"     elseif i + 2 == tabpagenr()
"       let s .= '%#TabLineSep2#ÓÇ∞'
"     else
"       let s .= 'ÓÇ±'
"     endif
"   endfor
" 
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
" 
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999X'
"   endif
" 
"   return s
" endfunction
" 
" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   let name = bufname(buflist[winnr - 1])
"   let label = fnamemodify(name, ':t')
"   return len(label) == 0 ? '[No Name]' : label
" endfunction

"set tabline=%!MyTabLine()
