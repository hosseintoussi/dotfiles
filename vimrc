set nocompatible
filetype off
filetype plugin on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
"Plugin 'akmassey/vim-codeschool'
Plugin 'joshdick/onedark.vim'
call vundle#end()            " required
filetype plugin indent on    " required

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

filetype indent plugin on
syntax on

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
set expandtab tabstop=2 softtabstop=2 shiftwidth=2 " Defaults to mixed mode

" display line number
set relativenumber
set number

" word wrap
nnoremap <Leader>w :set wrap!<CR>

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Customization for plugins
" -------------------------
" vim rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctrlp
let g:ctrlp_use_caching = 0

" ** Nerdtree toggle
nnoremap <Leader>\ :NERDTreeToggle<CR>
