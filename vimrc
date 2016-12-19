set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Plugins that I use
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'gregsexton/MatchTag'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
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
Plugin 'elixir-lang/vim-elixir'
Plugin 'joshdick/onedark.vim'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'akmassey/vim-codeschool'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()            " required

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

nmap <Leader><Up> :m-2<CR>
nmap <Leader><Down> :m+<CR>
" Set moving between windows to tab and doubletab.
noremap <TAB><TAB> <C-W>w
noremap <TAB> <C-W>

" jump to the next or previous method
nmap <Leader>m ]m
nmap <Leader>n [m

" Coding style preferences
"set expandtab tabstop=2 softtabstop=2 shiftwidth=2 " Defaults to mixed mode
autocmd FileType ruby set tabstop=2|set shiftwidth=2 |set expandtab
" display line number
set relativenumber
set number
set laststatus=2
" Added highlight of line and col
set cursorline
set cursorcolumn
" word wrap
nnoremap <Leader>w :set wrap!<CR>

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" ctrlp
let g:ctrlp_use_caching = 0

" ** Nerdtree toggle
nnoremap <Leader>\ :NERDTreeToggle<CR>
