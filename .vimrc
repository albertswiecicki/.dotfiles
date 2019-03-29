scriptencoding utf-8
" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the best vim plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Basic
" Better file browser
Plugin 'scrooloose/nerdtree'

" Class/module browser
" Usage nmap <F8> :TagbarToggle<CR>
Plugin 'majutsushi/tagbar'
" A Git wrapper so awesome
Plugin 'tpope/vim-fugitive'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Autoclose
Plugin 'Townk/vim-autoclose'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'python-mode/python-mode'
" ToDo
" Better autocompletion
Plugin 'Shougo/neocomplcache.vim'

" Snippets manager (SnipMate), dependencies, and snippets repo
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'honza/vim-snippets'
"Plugin 'garbas/vim-snipmate'

" awesome colorscheme
Plugin 'tomasr/molokai'
" Git/mercurial/others diff icons on the side of the file lines
Plugin 'mhinz/vim-signify'
" Automatically sort python imports
Plugin 'fisadev/vim-isort'
" Drag visual blocks arround
Plugin 'fisadev/dragvisuals.vim'
" Window chooser
" Plugin 't9md/vim-choosewin'
" Python and other languages code checker
Plugin 'vim-syntastic/syntastic'
" Relative numbering of lines (0 is the current line)
" Require Vim 7.3+
Plugin 'myusuf3/numbers.vim'
" Dockerfile support
Plugin 'ekalinin/Dockerfile.vim'


" ToConsider 
" Code commenter
" Plugin 'scrooloose/nerdcommenter'
" Code and files fuzzy finder
" Plugin 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plugin 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
" Plugin 'mattn/emmet-vim'
" Tab management for Vim
" Plugin 'kien/tabman.vim'
" Consoles as buffers
" Plugin 'rosenfeld/conque-term'
" Pending tasks list
" Plugin 'fisadev/FixedTaskList.vim'
" Surround
" Plugin 'tpope/vim-surround'
" Indent text object
" Plugin 'michaeljsmith/vim-indent-object'
" Paint css colors with the real color
" Plugin 'lilydjwg/colorizer'


" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab " replace tab with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" highlight cursor line and column
set cursorline
set cursorcolumn
" other settings
set langmenu=en_US.UTF-8
set mouse=a
" set whichwrap+=<,>,h,l,[,] " go to previous/next line after reaching start/end of line
set background=dark
set encoding=utf-8

set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like zsh
" (autocomplete menu)
set wildmenu
set wildmode=full

" auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" always show status bar
set laststatus=2

" incremental search
set incsearch
" highlighted search results
set hlsearch
" search ignore case
set ignorecase
" muting search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" syntax highlight on
syntax on
" show line numbers
set nu

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    colorscheme molokai
else
    colorscheme delek
endif

" custom mapping
vmap <C-C> "+y
map <F5> <Esc>:w<CR>:!clear;python3 %<CR>
noremap <c-s-up> ddkP
noremap <c-s-down> ddp
inoremap <c-s-up> <Esc>ddkPi
inoremap <c-s-down> <Esc>ddpi

" switch between tabls
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j


" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.
" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" turn to next or previous errors, after open errors list
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" syntastic checker for javascript.
" eslint is the only tool support JSX.
" If you don't need write JSX, you can use jshint.
" And eslint is slow, but not a hindrance
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_quiet_messages = {
    \ "regex":   'invalid-name\|missing-docstring'}

" Python-mode ------------------------------

" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1

let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
