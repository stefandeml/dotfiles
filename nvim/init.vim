call plug#begin('~/.local/share/nvim/plugged')
let mapleader=","

nnoremap gc :call NERDComment(0,"toggle")<CR>
vnoremap gc :call NERDComment(0,"toggle")<CR>

nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
nmap <C-W>n <plug>TilerNew
nmap <C-W>c <plug>TilerClose
nmap <C-W>. <plug>TilerRotateForwards
nmap <C-W>, <plug>TilerRotateBackwards

nmap <C-w><space> <Plug>TilerZoom
nmap <C-w>f <Plug>TilerFocus

inoremap jj <Esc>
nmap <C-p> :Files<cr>

map <C-n> :NERDTreeMirrorToggle<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>
nnoremap <C-t> :tabnew<CR>
noremap gt <C-w>gf
noremap gs <C-w>vgf
noremap gi <C-w>f

"imap <Tab> <C-X><C-F>

"""autocomple
imap <s-Tab> <C-X><C-F> 

Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'vim-airline/vim-airline'
Plug 'skywind3000/vim-preview'

""" Text
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
autocmd FileType mail,text,markdown,html,tex setlocal wrap

""" Appearance

  syntax on
  set nowrap

  " set cindent
  set expandtab
  set shiftwidth=2
  set softtabstop=2

  set laststatus=2
  set statusline=%F
  set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%))
set previewheight=6  " small preview window for docstrings, etc.

  set wildmenu
  set showcmd
  set lazyredraw
  set showmatch        " show matching brackets
set relativenumber   " relative numbers !!! wow

set ignorecase
set smartindent
set autoindent

Plug 'gasparch/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'                                       " NerdTree independent of tabs
Plug 'Xuyuanp/nerdtree-git-plugin'                                   " Git for NerdTree
Plug 'matze/vim-move'                                                " Move lines up and down
let g:move_key_modifier = 'C-S'
Plug 'zhamlin/tiler.vim'                                             " Window manager

Plug 'tomasiser/vim-code-dark'
let g:airline_theme = 'codedark'

Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']
  \ }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'plasticboy/vim-markdown'
"Plug 'mhartington/nvim-typescript'

" (Optional) Multi-entry selection UI.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'sakhnik/nvim-gdb'
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" Appearance
syntax on
set background=dark
let g:gruvbox_contrast_dark ='hard'
"colorscheme gruvbox
colorscheme codedark

set tabstop=2
" Check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Required for operations modifying multiple buffers like rename.
set hidden
set number

set clipboard=unnamed

let g:rustfmt_autosave = 1

" LanguageClient
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript.tsx': ['tcp://127.0.0.1:2089'],
    \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gD: call LanguageClient#textDocument_definition({'gotoCmd':'PreviewFile'})<CR>
nnoremap <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>H :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader>L :Buffers<CR>
nnoremap <Leader>K :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

nnoremap <Leader>d :call LanguageClient#explainErrorAtPoint()<CR>
" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"nmap <silent> <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode = '<tab>'
set mouse=a

" fzf config
  nmap <C-p> :Files<cr>
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit' }
  let g:fzf_layout = { 'down': '~20%' }


" Prettier
let g:prettier#autoformat = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#semi = 'false'

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\}
set enc=utf-8
set guifont=Powerline_Consolas:h11
  " Tiler
  tmap <C-q> <C-w>N
  nnoremap + <C-w>3+
  nnoremap _ <C-w>3-
  nnoremap <C-\> :term<CR><C-w>N:call tiler#reorder()<cr>i
  map <C-@> <plug>TilerNew
  let g:tiler#master#size = 50
  let g:tiler#master#count = 1
  let g:tiler#layout = 'right'
  let g:tiler#popup#windows = {
  \    'fzf': { 'position': 'bottom', 'size': 10, 'filetype': 'fzf', 'order': 3 },
  \    'nerdtree': { 'position': 'left', 'size': 8, 'filetype': 'nerdtree', 'order': 2 },
  \    'tagbar': { 'position': 'right', 'size': 10, 'filetype': 'tagbar', 'order': 1 },
  \ }

function! NumberToggle()
    if(&relativenumber == 1)
        call AbsNumber()
    else
        call RelNumber()
    endif
endfunc

function! RelNumber()
    set nonumber
    set relativenumber
endfunc

function! AbsNumber()
    set norelativenumber
    set number
  endfunc
  nnoremap               <Leader>n            :call NumberToggle()<CR>
  nnoremap               <Leader>M            :set mouse=""<CR>
  nnoremap               <Leader>m            :set mouse=a<CR>
  nnoremap               <Leader>N            :set nonumber<CR>
