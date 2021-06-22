
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
set colorcolumn=100
set autoindent
"set relativenumber

filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set number

set cursorline
set cursorcolumn
set listchars=tab:\|\ 
set list

set wildmenu

let mapleader=","

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=30
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>

setlocal indentkeys+=0.

map <Leader>nn :NERDTreeToggle<CR>

map gn :bn<cr>
map gp :bp<cr>
map bk :bd<cr>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)


"EMMET for HTML
let g:user_emmet_leader_key='<C-D>'
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#000000 guifg=#000000
endfunction

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Check syntax
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'

Plug 'flazz/vim-colorschemes'
Plug 'sstallion/vim-wtf'

Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'bagrat/vim-buffet'


"Auto close tags
Plug 'raimondi/delimitmate' 
Plug 'kien/ctrlp.vim'


"Typescript plugins
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

"Javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

"Format code plugins
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'

"Autcomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-tsserver

"Linting
"Plug 'dense-analysis/ale'

"Icons
"Plug 'ryanoasis/vim-webdevicons'
"brew tap homebrew/cask-fonts
"brew install --cask font-hack-nerd-font

call plug#end()

"Airline config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline_section_b = '%-0.10{getcwd()}'
"let g:airline_section_y = '%{strftime("%c")}'
"let g:airline_section_x = ''
"let g:airline_powerline_fonts = 1
"let g:airline_theme='simple'
"
"let g:lightline = {
"\    'colorscheme': 'wombat',
"\ }

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
let g:ale_sign_warning = '⚠'
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
"color WTF 
"color molokai
"color 1989
"color onedark
"color cobalt
"color simple_dark
"color gruvbox
"color PaperColor
"color wellsokai
"color github
color solarized8_dark
"color everforest
