"
" Setup
"
set history=500   "Set buffer history
set number        "Show line number
set mouse=a       "Sometimes it's good to use mouse

set ruler         "Show ruler
set magic         "Helps with regex

set expandtab     "Tabs as spaces (easier to indent code)
set smarttab      "Helps with tabs

set shiftwidth=2  "Set width -> 1 tab == 2 spaces
set tabstop=2     "Number of spaces for tab

set linebreak     "Wrap on linebreak
set textwidth=500 "Maximum width of text - linebreak on 500 characters
set wrap          "Wraps text

set autoindent    "Automatically indent from previous line
set smartindent   "Extend autoindent

set noerrorbells  "Fuck errors
set novisualbell  "Fuck errors

set hlsearch      "Highlight all search results
set ignorecase    "Case-insensitive search
set incsearch     "Show incremental search results as typedo

set nobackup      "Don't make a backup before overwriting file
set nowritebackup "Same as above
set noswapfile    "Ditch swapfile

syntax enable     "Enable syntax highlight

"
" More magic
"

" Search on <Space> (/)
map <space> /

" Backwards search on Ctrl-<space> (?)
map <c-space> ?

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" ,ss toggles spell checking
map <leader>ss :setlocal spell!<cr>

"
" Status line
"
set laststatus=2  "Always show the status line

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"
" Visual
"
try
  colorscheme iceberg
catch
endtry

set background=dark

"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'
Plug 'cocopon/iceberg.vim'
Plug 'preservim/nerdtree'

call plug#end()

colo iceberg

filetype plugin indent on
set backspace=indent,eol,start

" Set the rainbow!
let g:rainbow_active = 1

"
" Go setup
"

" Might be slow
" If imports are fucked - gofmt
let g:go_fmt_command = "goimports"
let g:go_gocode_propose_source = 0
let g:go_auto_type_info = 1
let g:go_version_warning = 0

"
" Coc.nvim setup
"
let g:coc_disable_startup_warning = 1
