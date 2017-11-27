" dein Scripts -----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/taro/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/taro/.local/share/dein')
  call dein#begin('/Users/taro/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/taro/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Plugins
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tpope/vim-rails')

  " ColorScheme
  call dein#add('dsolstad/vim-wombat256i')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" End dein Scripts-------------------------

" deoplete Scripts ----------------------
let g:deoplete#enable_at_startup = 1
call deoplete#enable()
" End deoplete Scripts ----------------------


" lightline Scripts --------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
\ }
" End lightline Scripts ----------------------

set background=dark
colorscheme wombat256i

set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set showcmd
set fileformats=unix,dos,mac
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set ambiwidth=double
set mouse=a
set clipboard+=unnamedplus
