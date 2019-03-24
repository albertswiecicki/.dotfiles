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
