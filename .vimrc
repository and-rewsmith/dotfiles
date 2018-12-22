set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-plug'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tyru/caw.vim'
Plugin 'raimondi/delimitMate'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-repeat'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'











" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" lighline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" nerdtree config
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" set number
let mapleader = ","
nmap <leader>nm :set number<cr>
nmap <leader>nnm :set nonumber<cr>

" gitgutter config
set updatetime=100

" indent config
let g:indentLine_enabled = 1

syntax on
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set foldmethod=indent
set foldlevelstart=99
