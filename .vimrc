"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Auto-generated                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
"set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set printoptions=paper:letter
" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/UltiSnips-2.2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Theme                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd ColorScheme * highlight RedundantSpaces term=standout ctermbg=red guibg=red
colo jellybeans
"match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
hi Folded ctermfg=green ctermbg=darkgray

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Probationary Options                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3
set sidescrolloff=3
set listchars=tab:>-,trail:.,eol:$
set visualbell
set autochdir
set gdefault
set shiftround
set smartindent
filetype on
filetype indent on
filetype plugin on
set showmatch
set incsearch
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set nojoinspaces
"autocmd FileType c,py,rb set formatoptions=croql

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Environment Setup                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set history=256
set wildmenu
set foldmethod=syntax
set mouse=a
set timeout timeoutlen=1000 ttimeoutlen=100
" Spellcheck current word
set keywordprg=c
" Cursor behavior
set backspace=indent,eol,start
set nostartofline
" Interface display modification
set ruler
set number
set showcmd
set title
" Standardized indentation
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
" For a better search
set ignorecase
set smartcase
set hlsearch
" File read/write options
set modeline
set suffixes=.bak,~,.swp,.o,.hi,.a,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set wildignore+=a.out,*.pyc,*.class,.git,*.o,*.a,*.hi,*.swp,*.jpg,*.png,*.xpm,*.gif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Keybindings                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
exec "set <PageUp>=\<Esc>[5;*~"
exec "set <PageDown>=\<Esc>[6;*~"
nmap <silent> <leader>w :set nolist!<CR>
imap    <Insert>    <Nop>
map     <F8>        <Esc>{j!}fmt -71<CR>}k$
imap    <F8>        <Esc>{j!}fmt -71<CR>}k$a
map     <F9>        g<C-g>
imap    <F9>        <C-O>g<C-g>
map     <F5>        <Esc>:w<CR>
imap    <F5>        <Esc>:w<CR>a
map     <PageUp>    <C-U>
imap    <PageUp>    <C-O><C-U>
map     <PageDown>  <C-D>
imap    <PageDown>  <C-O><C-D>
map     <C-t>       :tabnew<CR>:edit 
map!    <C-t>       <C-O>:tabnew<CR>:edit 
"" Dvorak Compensators
no d h
no h j
no t k
no n l

no D ^
no H J
no T K
no N $

no s :
no S :
no j d
no J D
no l n
no L N

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" vim: set ft=vim :
