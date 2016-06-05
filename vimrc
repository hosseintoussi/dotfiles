call pathogen#infect()
call pathogen#helptags()

" Settings
" -----------------

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

" Set moving between windows to tab and doubletab.
noremap <TAB><TAB> <C-W>w
noremap <TAB> <C-W>

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
