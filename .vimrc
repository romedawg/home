syntax on
 
filetype indent plugin on
 
set modeline
set background=dark
 
:set tabstop=8 expandtab shiftwidth=4 softtabstop=4
:set nu
 
imap jj <ESC>
 
set nocompatible                "cp:    turns off strct vi compatibility
" {{{ Search
 
set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results; ctrl-n or :noh to unhighlight
nmap <silent> <C-N> :silent noh<CR>
 
" }}}
" {{{ Line Wrap
 
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set nowrap                        "     defaults to line nowrap, ctrl-p toggles
nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>
 
" }}}
" {{{ Programming
 
so $VIMRUNTIME/syntax/syntax.vim "load syntax files
syntax on                       "syn:   syntax highlighting
set cindent                     "cin:   enables automatic indenting c-style
set cinoptions=(0,l1,j1         "cino:  affects the way cindent reindents lines
set showmatch                   "sm:    flashes matching brackets or parenthasis
set matchtime=3
set listchars=tab:>-,eol:$      "lcs:   makes finding tabs easier during `set list`
 
" }}}
" {{{ Tabs
 
"set smarttab                    "sta:   helps with backspacing because of expandtab
"set expandtab                   "et:    uses spaces instead of tab characters
set tabstop=4                   "ts:    number of spaces that a tab counts for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
 
" }}}
" {{{ Macro Helpers
 
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
 
" }}}
" {{{ Backups
 
set backup                      "bk:    makes a backup copy of every file you write to
set backupdir=~/tmp        "bdir:  this may not be the most secure location to store copies of all your files
 
" }}}
" {{{ HUD and Status Info
 
"set number                      "nu:    numbers lines
set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=1                 "ch:    make a little more room for error messages
set scrolloff=2                 "so:    places a couple lines between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple lines between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
 
" }}}
" {{{ Folding. zi toggles, spacebar expands
 
set foldmethod=marker
noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>
 
" }}}
" {{{ Menu completion
 
set wildmenu                    "wmnu:  enhanced ed command completion
set wildmode=longest:full,list:full  "wim:   helps wildmenu auto-completion
 
" }}}
" {{{ pseudo-tabs for multi-buffer editing. use :ball or invoke with -o
 
"       ctrl-j,k,l,h will move and maximize buffer
"       meta-j,k,l,h will just move between buffers
set switchbuf=useopen           "swb:   Jumps to first window that contains specified buffer instead of duplicating an open window
set winminheight=0              "wmh:   the minimal height of any non-current window
set winminwidth=0               "wmw:   the minimal width of any non-current window
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap j <C-W>j
nmap k <C-W>k
nmap <C-H> <C-W>h<C-W><bar>
nmap <C-L> <C-W>l<C-W><bar>
nmap h <C-W>h
nmap l <C-W>l
 
" }}}
" {{{ Spellchecking
 
set keywordprg=$VIMRUNTIME/tools/ref "kp:    Allows one-word spellchecking with 'K', replaces quick manpage lookup. Spellcheck in Vim 7 won't suck this bad
map ,sp :w<CR>:!ispell %<CR>:e %<CR>
au FileType xml,xslt,html map ,sp :w<CR>:!ispell -H %<CR>:e %<CR>
 
" }}}
" {{{ VimInfo
"
set viminfo='500,f1,:100,/100  " For a nice, huge viminfo file.
 
" }}}
" {{{ Remember last position in file
 
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
 
" }}}
" {{{ Autocommands and file type specific settings
 
filetype plugin indent on       "       Set options based on filetype (annoyance potential)
 
au FileType make set noexpandtab "      Tabs are required in makefiles, should be redundant with filetype plugin indent on
au FileType crontab set nobackup "      Crontab won't save otherwise, should be redundant with filetype plugin indent on
 
au FileType xml,xslt compiler xmllint " Enables :make for XML and HTML validation
au FileType html compiler tidy  "           use :cn & :cp to jump between errors
 
let html_use_css=1              "       for standards-compliant :TOhtml output
let use_xhtml=1                 "       for standards-compliant :TOhtml output
 
au FileType help set number     "       Use enter to activate help jump points & display line numbers
au FileType help nmap <buffer> <Return> <C-]>
au FileType help nmap <buffer> <C-[> <C-O>
 
autocmd FileChangedShell *
            \ echohl WarningMsg |
            \ echo "File has been changed outside of vim." |
            \ echohl None
 
" Mappings for the ToggleComment Plugin
noremap <silent> ,# :call CommentLineToEnd('# ')<CR>+
noremap <silent> ,/ :call CommentLineToEnd('// ')<CR>+
noremap <silent> ," :call CommentLineToEnd('" ')<CR>+
noremap <silent> ,; :call CommentLineToEnd('; ')<CR>+
noremap <silent> ,- :call CommentLineToEnd('-- ')<CR>+
noremap <silent> ,* :call CommentLinePincer('/* ', ' */')<CR>+
noremap <silent> ,< :call CommentLinePincer('<!-- ', ' -->')<CR>+
 
" Centers, left or right justifies text
noremap <silent> ,c :ce <CR> << <CR>
noremap <silent> ,l :le <CR>
noremap <silent> ,r :ri <CR>
 
" }}}
" {{{ GUI Options
set guioptions=grLt
set guifont=Courier_New:h10:cANSI
" }}}
 
" eof
