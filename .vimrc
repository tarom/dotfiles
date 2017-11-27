if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif

autocmd BufNewFile,BufRead *.es6 setf javascript
autocmd BufRead,BufNewFile *.axlsx setfiletype ruby

"------------------------------------
" neobundle.vim
"------------------------------------

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" let NeoBundle manage NeoBundle
" required! 
NeoBundleFetch 'Shougo/neobundle.vim'

" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'ujihisa/unite-colorscheme'

" My Bundles here:
" vim-scripts repos
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'noprompt/vim-yardoc'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'

let g:lightline = {
     \ 'colorscheme': 'wombat',
     \ 'mode_map': { 'c': 'NORMAL' },
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
     \ },
     \ 'component_function': {
     \   'modified': 'MyModified',
     \   'readonly': 'MyReadonly',
     \   'fugitive': 'MyFugitive',
     \   'filename': 'MyFilename',
     \   'fileformat': 'MyFileformat',
     \   'filetype': 'MyFiletype',
     \   'fileencoding': 'MyFileencoding',
     \   'mode': 'MyMode',
     \ },
     \ 'separator': { 'left': '⮀', 'right': '⮂' },
     \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
\ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction     \ }

NeoBundle 'sorah/vim-slim', { 'branch' : 'sorah' }
NeoBundle 'groenewege/vim-less'

" colorscheme
NeoBundle 'dsolstad/vim-wombat256i'

NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

syntax on

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
set clipboard+=unnamed
set clipboard+=autoselect

" Ruby用インデント設定
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" YAMLも
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" ERUBY
autocmd FileType eruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" HAML
autocmd FileType haml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" Slim
autocmd FileType slim setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" Sass
autocmd FileType sass setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" CoffeeScript
autocmd FileType coffee setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" HTML
autocmd FileType html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Smarty
autocmd FileType smarty setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" Javascript
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" JSON
autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" Terraform
autocmd FileType terraform setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" <ESC>2回でsearch highlight消し
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" window移動楽にしたい
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

" camelize
map <Leader>c <Plug>(operator-camelize)
map <Leader>C <Plug>(operator-decamelize)

filetype plugin indent on     " required!

set background=dark
colorscheme wombat256i

"------------------------------------
" neocomplete.vim
"------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use camel case completion.
let g:neocomplete#enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplete#enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplete#snippets_expand)
smap <C-k>     <Plug>(neocomplete#snippets_expand)
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplete#sources#snippets_complete#expandable() ? "\<Plug>(neocomplete#snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#omni_patterns')
  let g:neocomplete#omni_patterns = {}
endif
let g:neocomplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplete#omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplete#omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ZenCoding.vim
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_complete_tag = 1

" rails.vim
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" vimfiler.vim
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winw

" vimsnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
