" For more options see ":help option-list" and ":options".

" make VIM use all default modes instead of what VI uses
set nocompatible

" show full path in status line for current file
"set statusline+=%F

" change the mapleader from \ to ,
" NOTE: This has to be set before <leader> is used.
let mapleader=","

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" use mouse in vim for scrolling
set mouse=a

" display incomplete commands
set showcmd

"+------------------Clipboard stuff----------------------+
"| note that "x" will always cut to the system clipboard |
"| command :reg will display all clipboard contents      |
"| ,q will copy the current line to the clipboard        |
"| ,Q will append the current line to what is already    |
"| on the clipboard. Then ,y copies the visual selection |
"| to the clipboard, ,p will paste that buffer           |
"+-------------------------------------------------------+
" use the system clipboard by default; use clipboard+=unnamedplus for full clipboard
set clipboard+=unnamedplus
" quick copy a line and go to the next line, saves text to register "q"
map <leader>q "qY<CR>
map <leader>Q "QY<CR>
map <leader>y "+y
map <leader>p "+p
"the line below will wipe out all registers that coorespond to any letter
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
map Y y$

" vertically scroll to top of document when entering insert mode
autocmd InsertEnter * norm zt

" remove trailing spaces from lines on save
autocmd BufWritePre * %s/\s\+$//e

" Set relative line numbers for nor & reg for ins mode
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Save 1,000 items in history
set history=1000

" set tab stops
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

"set listchars=space:_,tab:>~ list " this will add underscored for all whitespace

" set backspace over everything in insert mode w/o this it won't bkspc
:set backspace=indent,eol,start

" no line wrap
set nowrap

" search setting if possible to timeout
if has ('reltime')
set incsearch
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on
  " Highlight search matches
  set hlsearch
  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif
syntax enable
set background=dark

if !has('gui_running')
    set termguicolors
    syntax enable
    set background=dark
    colorscheme modice
else
  colorscheme iceberg
endif

" Show the line and column number of the cursor position
set ruler

" Display the incomplete commands in the bottom right-hand side of your screen.
set showcmd

" sets a magenta color on status line when in Insert Mode
set laststatus=2
if version >=700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

" Enable incremental searching
set incsearch

" Ignore case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" Turn on line numbering
set number

" Don't line wrap mid-word.
set lbr

" Copy the indentation from the current line.
set autoindent

" Enable smart autoindenting.
set smartindent

" Use spaces instead of tabs
set expandtab

" Remap VIM 0 to first non-blank character
"map 0 ^ --removed this as it makes more sense to go to the beginning of the
"line then to go to the first character you would then press 0w to go there
"and wala!

" Easily create HTML unorded lists.
map <F3> i<ul><CR><Space><Space><li></li><CR><Esc>I</ul><Esc>kcit
map <F4> <Esc>o<li></li><Esc>cit

" Quickly save your file.
map <leader>w :w!<cr>

"start maximised"
au GUIEnter * simalt ~x

"add package manager
packloadall

"set font size for console"
set guifont=Consolas:h14

" turn on column/cursor hightlights
"set cursorcolumn
"set cursorline

"in INSERT mode press jk to enter NORMAL mode
inoremap jk <Esc>

"in COMMAND mode press jk to enter NORMAL mode
cnoremap jk <Esc>

"in Normal mode add a space when you hit the space bar
nnoremap <space> i<space><esc>

"set backups for vim files to tmp folder use // to force
"filename will show full path in Windows File Explorer filename
set backupdir=$TEMP//
set directory=$TEMP//
set undodir=$TEMP//

