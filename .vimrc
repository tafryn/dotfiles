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
set runtimepath+=~/.vim/bundle/ultisnips.vim
set runtimepath+=~/.vim/bundle/vim-snippits.vim
set runtimepath+=~/.vim/bundle/tagbar.vim
set runtimepath+=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/nerdtree.vim

:helptags ~/.vim/bundle/ultisnips.vim/doc
:helptags ~/.vim/bundle/tagbar.vim/doc
:helptags ~/.vim/bundle/ctrlp.vim/doc
:helptags ~/.vim/bundle/nerdtree.vim/doc

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
"set smartindent
filetype on
filetype indent on
filetype plugin on
set showmatch
set incsearch
set backupdir=~/.vim-tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
set nojoinspaces
"autocmd FileType c,py,rb set formatoptions=croql
let g:xml_syntax_folding=1
set tags+=./.tags;/

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
nmap <silent> <leader>b :TagbarToggle<CR>
nmap <silent> <leader>. :CtrlPTag<CR>
nmap <silent> <leader>t :NERDTreeToggle<CR>
imap    <Insert>    <Nop>
map     <F7>        :setlocal spell!<CR>
imap    <F7>        <C-o>:setlocal spell!<CR>
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
map!    <C-t>       <C-O>:tabnew<CR><C-O>:edit 
map     <C-f>       gqip
imap    <C-f>       <C-o>gqip
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

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" vim: set ft=vim :
