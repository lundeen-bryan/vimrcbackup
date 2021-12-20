" For more options see ":help option-list" and ":options".

"add package manager
packloadall

" make VIM use all default modes instead of what VI uses
set nocompatible

" show full path in status line for current file on right side of statusline
set statusline=%F

" Shortcuts file has keymaps
source ~/.vim/shortcuts.vim

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

" use the system clipboard by default; use clipboard+=unnamedplus for full clipboard
set clipboard+=unnamedplus

"the line below will wipe out all registers that correspond to any letter
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

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
set backspace=indent,eol,start

" no line wrap
set nowrap

" search setting if possible to timeout
if has ('reltime')
set incsearch
endif

" Toggle off search highlight
map <leader>hl :noh<CR>


" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
"if &t_Co > 2 || has("gui_running")
"if I'm running gvim GUI AND I have more than 256 colors available then
"if &t_Co > 2 || has("gui_running")
if has('gui running')
  " Revert with ":syntax off".
  syntax on
  " Highlight search matches
   set hlsearch
  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  colorscheme iceberg
else
" if I'm using terminal vim then I'll set the following
    " use 256color setting for full color range
    set term=xterm-256color
    set termguicolors
    syntax enable
    colorscheme default
    set background=dark
endif

"Make a block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Show the line and column number of the cursor position
set ruler

" Display the incomplete commands in the bottom right-hand side of your screen.
set showcmd

" ================= Terminal statusbar color ======================
" sets a magenta color on status line when in Insert Mode,
" otherwise it's green
set laststatus=2
if version >=800
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
" ================= End Terminal statusbar color ===================

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

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

"start maximised"
au GUIEnter * simalt ~x

"set font size for console"
set guifont=Consolas:h14

" turn on column/cursor hightlights
"set cursorcolumn
"set cursorline

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" . scan the current buffer, b scan other loaded buffers that are in the buffer list, u scan the unloaded buffers that
" are in the buffer list, w scan buffers from other windows, t tag completion
set complete=.,b,u,w,t,]

" Keyword list
set complete+=k~/.vim/keywords.txt

"set backups for vim files to tmp folder use // to force
"filename will show full path in Windows File Explorer filename
set backupdir=$TEMP//
set directory=$TEMP//
set undodir=$TEMP//

