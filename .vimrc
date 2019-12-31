syntax on
 
filetype indent plugin on
 
set modeline
set background=dark
set list
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set nu
 
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
