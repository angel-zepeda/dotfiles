filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required
set encoding=UTF-8

set nocompatible
set noswapfile
set nobackup
set encoding=UTF-8
set laststatus=2     
"set relativenumber 
set showmatch 	     
set colorcolumn=80
set autoindent
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set number

set cursorline
set cursorcolumn

set wildmenu

let mapleader=","

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=24

setlocal indentkeys+=0.

map <Leader>nn :NERDTreeToggle<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  


"EMMET for HTML
let g:user_emmet_leader_key='<C-D>'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'raimondi/delimitmate'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'ryanoasis/vim-devicons'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'victorze/foo'

Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'sbdchd/neoformat'

Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'prettier/vim-prettier'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

syntax on
set t_Co=256
set background=dark
syntax enable

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_y = '%{strftime("%c")}'
let g:airline_section_x = ''
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.tsx Neoformat

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint', 'eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"let g:ale_fix_on_save = 1
"

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"color OceanicNext   
"color github
"color PaperColor
"color molokai
"color 1989 
"color onedark
"color cobalt
"color black_is_the_color 
"color simple_dark
"color darkspace
color PaperColor
