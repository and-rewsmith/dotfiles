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
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-repeat'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'jiangmiao/auto-pairs'

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

"  Cntrl p config
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0 
let g:ctrlp_max_depth=40

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
let NERDTreeShowHidden=1

" set number
let mapleader = ","
nmap <leader>nm :set number<cr>
nmap <leader>nnm :set nonumber<cr>

" gitgutter config
set updatetime=100

" indent config
" let g:vim_json_syntax_conceal = 0
autocmd Filetype json let g:indentLine_enabled = 0
" let g:indentLine_setConceal = 0
let g:indentLine_enabled = 1

" pylint config
let mapleader = ","
nmap <leader>er :SyntasticCheck<cr>
nmap <leader>re :SyntasticReset<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['python', 'html', 'javascript'] }


" incsearch config
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" easytags config
set tags=./tags,tags;$HOME
" let mapleader = ","
" nmap <leader><C-]> <C-w><C-]><C-w>T
nnoremap <silent><C-]> <C-w><C-]><C-w>T

" YCMD config
let mapleader = ","
let g:ycm_goto_buffer_command = "new-tab"
nmap <leader>inf :YcmCompleter GetDoc<cr>
nmap <leader>ck <C-w>k:q
nmap <leader>def :YcmCompleter GoToDefinition<cr>


syntax on
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set foldmethod=indent
set foldlevelstart=99
au FileType text set smartindent
set breakindent
nnoremap d "_d
vnoremap d "_d
