" I keep my entire ~/.vim directory within a git repository stored here. What
" this does is give me the ability to go to a shiny new box and say git clone
" and have my entire vim environment exactly the way I want it.
" git clone git@github.com:zjt/vim.git .vim
" ln -s .vim/vimrc .vimrc
" git pull
" git commit -m 'I made a change'
" git push
"

"
" XXX TUTORIAL
" from https://danielmiessler.com/study/vim
"
" Verbs are the actions we take, and they can be performed on nouns. Here are
" some examples:
"
"  d: delete
"  c: change
"  y: yank (copy)
"  v: visually select (V for line vs. character)
"
" Modifiers are used before nouns to describe the way in which you’re going to
" do something. Some examples:
"
"  i: inside
"  a: around
"  NUM: number (e.g.: 1, 2, 10)
"  t: searches for something and stops before it
"  f: searches for that thing and lands on it
"  /: find a string (literal or regex)
"
" In English, nouns are objects you do something to. They are objects. With
" vim it’s the same. Here are some vim nouns:
"
"  w: word
"  s: sentence
"  ): sentence (another way of doing it)
"  p: paragraph
"  }: paragraph (another way of doing it)
"  t: tag (think HTML/XML)
"  b: block (think programming)
"
" You can also use nouns as motions, meaning you can move around your content
" using them as the size of your jump.
"
" just like English, you combine the verbs, modifiers, and nouns in (soon to
" be) intuitive ways.
"
" VMN (verb, modifier, noun):
"
" # Delete two words
" d2w
"
" # Change inside sentence
" (delete the current one and enter insert mode)
" cis
"
" # Change to open bracket
" (change the text from where you are to the next open bracket)
" ct<
"
"
" XXX searching/jumping
"
" # Jump forward and land on the < character
" f<
"
" # Jump forward and land right before the < character
" t<
"
" ; will repeat the previous t and f jumps.
"
" Change to the next “<“
" ct<
"
" A search reference
"
"  /{string}: search for string
"  t: jump up to a character
"  f: jump onto a character
"  *: search for other instances of the word under your cursor
"  n: go to the next instance when you’ve searched for a string
"  N: go to the previous instance when you’ve searched for a string
"  ;: go to the next instance when you’ve jumped to a character
"  ,: go to the previous instance when you’ve jumped to a character
"
" 
" XXX Moving
"
"  by word
"
"  w: move forward one word
"  b: move back one word
"  e: move to the end of your word
"
" When you use uppercase you ignore some delimiters within a string that may break it into two words.
"
"  W: move forward one big word
"  B: move back one big word
"
" Moving by sentence or paragraph
"
"  ): move forward one sentence
"  }: move forward one paragraph
"
" Moving within the screen
"
"  H: move to the top of the screen
"  M: move to the middle of the screen
"  L: move to the bottom of the screen
"  gg: go to the top of the file
"  G: go to the bottom of the file
"  ^U: move up half a screen
"  ^D: move down half a screen
"  ^F: page down
"  ^B: page up
"
" Jumping back and forth
"
"  Ctrl-i: jump to your previous navigation location
"  Ctrl-o: jump back to where you were
"
" Other motions
"
"  :$line_number: move to a given line number
"  ^E: scroll up one line
"  ^Y: scroll down one line
"
" Basic change/insert options
"  
"  i: insert before the cursor
"  a: append after the cursor
"  I: insert at the beginning of the line
"  A: append at the end of the line
"  o: open a new line below the current one
"  O: open a new line above the current one
"  r: replace the one character under your cursor
"  R: replace the character under your cursor, but just keep typing afterwards
"  cm: change whatever you define as a movement, e.g. a word, or a sentence, or a paragraph.
"  C: change the current line from where you’re at
"  ct?: change change up to the question mark
"  s: substitute from where you are to the next command (noun)
"  S: substitute the entire current line
"
" Formatting Text
"
" # Format the current paragraph
"  gqap
" gq works based on your textwidth setting, which means it’ll true up whatever
" you invoke it on to be nice and neat within those boundaries.
" NOTE: The “ap” piece is the standard “around paragraph” text object.
" 
" Deleting text
"
"  x: exterminate (delete) the character under the cursor
"  X: exterminate (delete) the character before the cursor
"  dm: delete whatever you define as a movement, e.g. a word, or a
"      sentence, or a paragraph.
"  dd: delete the current line
"  dt.: delete delete from where you are to the period
"  D: delete to the end of the line
"  J: join the current line with the next one
"     (delete what’s between)
"
" Undo and Redo
"
"  u: undo your last action.
"  Ctrl-r: redo the last action
"
" Finding misspelled words
"  # Go to the next misspelled word
"   ]s
"  # Go to the last misspelled word
"   [s
"  # When on a misspelled word, get some suggestions
"   z=
"  # Mark a misspelled word as correct
"   zg
"  # Mark a good word as misspelled
"   zw
"
" # Delete around a word
"  daw
"
" # Change inside a sentence
"  cis
"
" There are also a number of other object types
"  paragraphs: ip and ap
"  single quotes: i' and a'
"  double quotes: i" and a"
"
" ci" and it’ll delete everything inside the double quotes and drop you inside
" them in Insert Mode
"
" A text object reference
"
"  words: iw and aw
"  sentences: is and as
"  paragraphs: ip and ap
"  single quotes: i' and a'
"  double quotes: i" and a"
"  back ticks: i` and a`
"  parenthesis: i( and a(
"  brackets: i[ and a[
"  braces: i{ and a{
"  tags: it and at
"
" Visual Mode
"
"  character-based: v
"  line-based: V
"  paragraphs: Ctrl-v
"
" # Select inside of parenthesis
"  vi(
" # Select inside of brackets
"  vi[
" # Select everything inside the second tier braces
"  v2i{
" NOTE: You can also use va to select around instead of inside
"
" If we want to prepend a colon in front of every line, you can simply put one
" in front of foo, visually select all the lines below it, and then hit the .
" key. NOTE: One thing that makes this possible is having vnoremap .
" :norm.<CR> in my ~/.vimrc
"
" Using Macros
"  qa: start recording a macro named “a”
"  q: stop recording
"  @a: play back the macro
"
" Changing File Type
"  set ft=unix
"  set ft=html
"  set ft=dos
" NOTE: To show the current filetype, run or put :set filetype into your
" ~/.vimrc
"
" Wrapping Content
"  
"  cs"': for the word you’re on, change the surrounding quotes from double
"        to single
"  cs'<q>: do the same, but change the single quotes to <q>
"  ds": delete the double quotes around something
"  ysiw[: surround the current word with brackets
"  ysiw<em>: emphasize the current word (it works with
"            text objects!) Want to know what’s crazier about that?
"            It’s dot repeatable!.
"  Visual Mode: select anything, and then type S.
"               You’ll be brought to the bottom of the window. Now
"               type in what you want to wrap that with, such as <a
"               href="/images">, and then press enter.
"

" TODO
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

" TODO this seems inconsistent
" the <Esc> key for leaving insert mode is, in my opinion, rather antiquated. Vim is about efficiency, and it’s hardly efficient to leave the home keys if you don’t have to. 
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
