filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=UTF-8
set termguicolors
syntax on
set t_Co=256
set background=dark
syntax enable


set nocompatible
set noswapfile
set nobackup
set laststatus=2
set showmatch
set colorcolumn=80
set autoindent
"set relativenumber

filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set number

"set cursorline
"set cursorcolumn

set wildmenu

let mapleader=","

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=24
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>

setlocal indentkeys+=0.

map <Leader>nn :NERDTreeToggle<CR>

map gn :bn<cr>
map gp :bp<cr>
map bk :bd<cr>


"EMMET for HTML
let g:user_emmet_leader_key='<C-D>'

Plugin 'scrooloose/nerdtree'

"Check syntax
Plugin 'scrooloose/syntastic'

"Plugin 'vim-ruby/vim-ruby'

Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'

"Plugin 'honza/vim-snippets'
"Plugin 'mattn/emmet-vim'

"Auto close tags
Plugin 'raimondi/delimitmate' 

Plugin 'kien/ctrlp.vim'

"Plugin 'ryanoasis/vim-devicons'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"Typescript plugins
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

"Javascript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

"Format code plugins
"Plugin 'sbdchd/neoformat'
Plugin 'prettier/vim-prettier'

"Autcomplete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-tsserver

"Linting
"Plugin 'dense-analysis/ale'

"Icons
"Plugin 'ryanoasis/vim-webdevicons'
"brew tap homebrew/cask-fonts
"brew install --cask font-hack-nerd-font


"Airline config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline_section_b = '%-0.10{getcwd()}'
"let g:airline_section_y = '%{strftime("%c")}'
"let g:airline_section_x = ''
"let g:airline_powerline_fonts = 1
"let g:airline_theme='distinguished'

"Add extensions to highlights
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

"Set extension for neoformat
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.tsx Neoformat

"Symbols to show git status
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '˜'
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
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

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
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


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


"Icons

let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"color OceanicNext
"color github
"color molokai
"color 1989
"color onedark
"color cobalt
"color simple_dark
"color gruvbox
"color PaperColor
