" I keep my entire ~/.vim directory within a git repository stored here. What
" this does is give me the ability to go to a shiny new box and say git clone
" and have my entire vim environment exactly the way I want it.
" git clone git@github.com:zjt/vim.git .vim
" ln -s .vim/vimrc .vimrc
" git pull
" git commit -m 'I made a change'
" git push
"
" or, for read only
" git clone https://github.com/zjt/vim.git .vim

" the <Esc> key for leaving insert mode is, in my opinion, rather antiquated.
inoremap jk <ESC>

" remap the leader key to Space.
let mapleader = "\<Space>"

" TODO document exactly what this does
filetype plugin indent on

" TODO document exactly what this does
syntax on

" TODO document exactly what this does
set encoding=utf-8

" ZZ: a faster way to do :wq
inoremap ZZ :wq

" force me to use hjkl to navigate
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" enable this to reinforce myself to use wordwise motions and character search
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

" spell check
" set spell|nospell to toggle on and off
set spell
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!

" allows me to use '.' on a block of text
vnoremap . :norm.<CR>
