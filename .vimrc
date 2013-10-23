execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" backspace in insert mode works like normal editor
set backspace=2

syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set number              " line numbers
set nobackup            " get rid of anoying ~file
set nowrap		" stop wrapping lines around!
set laststatus=2	" always show the status line
set history=500		" keep 500 lines of command history
set showcmd		" show incomplete commands
set showmatch		" show search matches

set bg=dark		" use dark bagground
colorscheme desert      " colorscheme desert

" say no to code folding
set foldlevelstart=99
set foldlevel=99
set nofoldenable
let g:vim_markdown_folding_disabled=0

" Mappings

" Set the leader key
let mapleader = ","

" Insert an empty line above the current line
map <Leader>O :<C-U>call append(line(".") -1, repeat([''], v:count1))<CR>

" Insert an empty line below the current line
map <Leader>o :<C-U>call append(line("."), repeat([''], v:count1))<CR>

" Ctrl-s for save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>
