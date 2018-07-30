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
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
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
noremap <Leader>y "*y
set guioptions+=a

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
