set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Plugins that I use
Plugin 'VundleVim/Vundle.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/closetag.vim'
Plugin 'tpope/vim-commentary'
Plugin 'joshdick/onedark.vim'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'akmassey/vim-codeschool'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'

call vundle#end()            " required

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
Plug 'pangloss/vim-javascript'

call plug#end()

set rtp+=/usr/local/opt/fzf

" disabling swap files :D LOL
set noswapfile

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Color settings
" ----------------
set background=dark
colorscheme onedark
"settings
" ----------------
" Enable Matchiit
runtime macros/matchit.vim

" Setting leader key to space
let mapleader = "\<Space>"

syntax on
filetype indent plugin on

" Support all three fileformats, in this order
set ffs=unix,mac,dos
set encoding=utf-8

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <Leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <Leader>so :source $MYVIMRC<cr>

" Move to the beginning and end of line
nmap <Leader><Left> ^
nmap <Leader><Right> $

" Move an entire line up or down
nmap <Leader><Up> :m-2<CR>
nmap <Leader><Down> :m+<CR>

" Set moving between windows to tab and doubletab.
noremap <TAB><TAB> <C-W>w
noremap <TAB> <C-W>

" yank to clipboard
vmap <Leader>y "*y

" file finding with fzf
nmap <Leader>t :Files<CR>

" Buffers
nmap <Leader>b :Buffers<CR>
nmap XX :bd<CR>

" replace with Register 0
map <leader>rr ciw<C-r>0<Esc>

" Coding style preferences
"set expandtab tabstop=2 softtabstop=2 shiftwidth=2 " Defaults to mixed mode
autocmd FileType * set tabstop=2|set shiftwidth=2 |set expandtab

" display line number
set relativenumber
set number
set laststatus=2

" Functions to hide and display line numbers
function! Hidenu()
  :set nonumber
  :set nornu
endfunction

function! Shownu()
  :set number
  :set rnu
endfunction

nmap <Leader>hn :exec Hidenu()<cr>
nmap <Leader>sn :exec Shownu()<cr>

" Added highlight of line and co
set cursorline
set cursorcolumn

" highlight column 80 and 100
set colorcolumn=80,100

" word wrap, for when the window is too small
nnoremap <Leader>w :set wrap!<CR>

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" slow scroll issues
set lazyredraw

" ** Nerdtree toggle
nnoremap <Leader>\ :NERDTreeToggle<CR>
