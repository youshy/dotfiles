"
" Setup
"

" map leader to comma
let mapleader = ","

set history=500   "Set buffer history
set mouse=a       "Sometimes it's good to use mouse
set number        "Show line number

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

set colorcolumn=120 "So the code looks nice, creates a soft column

syntax enable     "Enable syntax highlight

command! SGB set spell spelllang=en_gb "We're in England, ey?
set spellsuggest=best,9 "Get some suggestions

" https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""    "Fix weird characters
let &t_TE = ""

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

" Fast exit and save
nmap <leader>x :x<cr>

" ,ss toggles spell checking
map <leader>ss :setlocal spell!<cr>

"
" NERDTree
"
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

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
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Stuff I'm checking for Neovim
Plug 'kyazdani42/nvim-web-devicons' "icons for shit
Plug 'romgrk/barbar.nvim'           "switching buffers!
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'

call plug#end()

colo iceberg

filetype plugin indent on
set backspace=indent,eol,start

" COC
try
    nmap <silent> ]c :call CocAction('diagnosticNext')<cr>
    nmap <silent> [c :call CocAction('diagnosticPrevious')<cr>
endtry

" Set the rainbow!
let g:rainbow_active = 1

"
" Vim-Unimpaired
"
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" 
" Telescope setup
"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"
" Barbar

set termguicolors

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode>
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Tab>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Tab>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Tab>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Tab>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable animations
let bufferline.animation = v:true

" Enable current/total tabpages indicator
let bufferline.tabpages = v:true

" Enable auto-hiding when there's a single buffer
let bufferline.auto_hide = v:true

"
" Matchit
"
" Used for navigating between tags
"

runtime macros/matchit.vim

"
" Go setup
"

" Might be slow
" let g:go_gocode_propose_source = 0
let g:go_auto_type_info = 1
let g:go_version_warning = 0
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1 "gofumpt-it

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highligh_operators = 1

let g:go_def_mode="gopls"
let g:go_info_mode="gopls"

set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect,noinsert,longest
inoremap <expr> <C-j> pumvisible() ? '<Down>' : '<C-x><C-o>'
inoremap <expr> <C-k> pumvisible() ? '<Up>' : '<C-x><C-o>'

"
" WhichKey setup
"

lua << EOF
  require("which-key").setup {}
EOF

"
" Coc.nvim setup
"
" let g:coc_disable_startup_warning = 1
