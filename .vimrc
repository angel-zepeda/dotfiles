filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
set noswapfile
set nobackup
set encoding=UTF-8
set laststatus=2     
set number 	         
"set relativenumber 
set showmatch 	     
set colorcolumn=80
set autoindent
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2

set cursorline
"set cursorcolumn

"set wildmode=longest,list,full
set wildmenu
set guifont=Monospace\ 10
autocmd BufWritePre *.js :normal gg=G 

let mapleader=","
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <Leader>nn :NERDTreeToggle<CR>
let g:NERDTreeWinSize=24
setlocal indentkeys+=0.

"EMMET for HTML
let g:user_emmet_leader_key='<C-D>'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'sstallion/vim-wtf'
Plugin 'taglist.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'

syntax on
set t_Co=256
set background=dark
syntax enable
let g:solarized_termtrans = 1                                                   
let g:molokai_original = 1
let g:rehash256 = 1
let g:solarized_termcolors=256
let g:airline_theme = "term"
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
let g:neocomplete#enable_at_startup = 1

"colorscheme wtf 
"colorscheme nordisk 
"colorscheme PaperColor
"colorscheme molokai
"color papaya_original 
"color cobalt
"color wombat
color jellybeans
"color Atelier_LakesideLight
