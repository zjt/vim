" What I liked most about Janus was the way it managed your plugins for you,
" but I do that through Pathogen. Basically, all you have to do with this
" config is:
"
"   1 Install Pathogen https://github.com/tpope/vim-pathogen
"   2 git clone your plugins into ~/.vim/bundle
"   3 Add execute pathogen#infect() to your ~/.vimrc
"
"   Done and done. Now you can play with any plugins you want using
"   the method above and you won’t have to worry about how they get
"   loaded.

" the <Esc> key for leaving insert mode is, in my opinion, rather antiquated. Vim is about efficiency, and it’s hardly efficient to leave the home keys if you don’t have to. 
inoremap jk <ESC>

" The default leader (\) key seems rather out of the way as well, so I like to remap the leader key to Space.
" TODO this doesn't work as described on https://danielmiessler.com/study/vim
"let mapleader = "\<Space>"

" TODO document
filetype plugin indent on

" TODO document
syntax on

" TODO document
set encoding=utf-8

