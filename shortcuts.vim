" For more options see ":help option-list" and ":options".

" ======================= All shortcuts are referenced by the _vimrc file
"
" change the mapleader from \ to ,
" NOTE: This has to be set before <leader> is used.
let mapleader=","

" Toggle highlighting off
map <leader>hh :set hlsearch!<CR>
map <leader>HH :set hlsearch<CR>
map <leader>hl :noh<CR>

" Quickly save your file.
map <leader><leader>w :w!<cr>

" Open a terminal below window
nnoremap <leader>tt :bot terminal<CR>

"load nerdtree automatically
"autocmd vimenter * NERDTree
map <leader>nerd :NERDTree<CR>

" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
map Y y$

"script_31337_path_and_na[m]e_without_extension_11

" Easily create HTML unorded lists.
map <F3> i<ul><CR><Space><Space><li></li><CR><Esc>I</ul><Esc>kcit
map <F4> <Esc>o<li></li><Esc>cit

" map 2commas to the ctrl+y command for emmet  completion
imap ,, <C-y>,

"in INSERT mode press jk to enter NORMAL mode
inoremap jk <Esc>

"in COMMAND mode press jk to enter NORMAL mode
cnoremap jk <Esc>

"in Normal mode add a space when you hit the space bar
nnoremap <space> i<space><esc>

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
