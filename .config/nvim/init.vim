packadd! vim-colors-solarized
packadd! vimtex
source $XDG_CONFIG_HOME/nvim/lsp.vim
source $XDG_CONFIG_HOME/nvim/treesitter.vim

set timeoutlen=250 ttimeoutlen=-1
set number
set relativenumber
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set tabstop=2
set splitright
set splitbelow
set textwidth=80
set colorcolumn=81
set nohlsearch
set undofile

filetype plugin indent on
syntax enable
colorscheme solarized

let g:vimtex_view_general_viewer = 'zathura'

let mapleader = ' '

" navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" put first word of current line on new line, end in insert mode
nnoremap <Leader>o 0yeo<Esc>pa<Space>
" copy selection to clipboard
xnoremap <Leader>y "+y
" paste from clipboard
nnoremap <Leader>p "+p
" insert {-# LANGUAGE #-}
nnoremap <Leader>l i{-#<Space>LANGUAGE<Space><Space>#-}<Esc>3hi
" make
nnoremap <Leader>m :make<CR>

