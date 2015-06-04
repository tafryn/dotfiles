"|    Auto-generated                                                      {{{
"|===========================================================================
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
" }}} "

"|    Plugins                                                             {{{
"|===========================================================================
set runtimepath+=~/.vim/bundle/ultisnips.vim
set runtimepath+=~/.vim/bundle/vim-snippits.vim
set runtimepath+=~/.vim/bundle/tagbar.vim
set runtimepath+=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/nerdtree.vim

:helptags ~/.vim/bundle/ultisnips.vim/doc
:helptags ~/.vim/bundle/tagbar.vim/doc
:helptags ~/.vim/bundle/ctrlp.vim/doc
:helptags ~/.vim/bundle/nerdtree.vim/doc
" }}} "

"|    Theme                                                               {{{
"|===========================================================================
let g:jellybeans_overrides = {
            \ 'Folded': { 'guifg': '6c6c6c', 'guibg': '303030', 'ctermfg': '', 'ctermbg': '', 'attr': 'italic' },
            \ 'Comment': { 'guifg': '626262', 'guibg': '', 'ctermfg': 'Grey', 'ctermbg': '', 'attr': 'italic' },
            \ 'LineNr': { 'guifg': '605958', 'guibg': '262626', 'ctermfg': '262626', 'ctermbg': '', 'attr': '' },
            \ 'Function': { 'guifg': 'ffd75f', 'guibg': '', 'ctermfg': 'Yellow', 'ctermbg': '', 'attr': '' },
            \ 'Search': { 'guifg': 'ff87ff', 'guibg': '302028', 'ctermfg': 'Magenta', 'ctermbg': '', 'attr': 'underline' },
            \ 'SpecialKey': { 'guifg': '808080', 'guibg': 'af0000', 'ctermfg': 'Dark Red', 'ctermbg': '', 'attr': '' },
            \}
            "\ 'Statement': { 'guifg': '5f87d7', 'guibg': '', 'ctermfg': 'DarkBlue', 'ctermbg': '', 'attr': '' },
            "\ 'String': { 'guifg': '5faf5f', 'guibg': '', 'ctermfg': 'Green', 'ctermbg': '', 'attr': '' },
let g:jellybeans_background_color_256="none"
colo jellybeans
hi Folded ctermfg=green ctermbg=darkgray
" }}} "

"|    Probationary Options                                                {{{
"|===========================================================================
set autochdir
"set smartindent
set backupdir=~/.vim-tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
"autocmd FileType c,py,rb set formatoptions=croql
let g:xml_syntax_folding=1
" }}} "

"|    Environment Setup                                                   {{{
"|===========================================================================
set listchars=tab:>-,trail:.,eol:$
set nojoinspaces
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
set scrolloff=3
set sidescrolloff=3
" Interface display modification
set ruler
set number
set showcmd
set title
set visualbell
" Standardized indentation
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
" For a better search
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
" File read/write options
set modeline
set suffixes=.bak,~,.swp,.o,.hi,.a,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set wildignore+=a.out,*.pyc,*.class,.git,*.o,*.a,*.hi,*.swp,*.jpg,*.png,*.xpm,*.gif
set tags+=./.tags;/
filetype on
filetype indent on
filetype plugin on
" }}} "

"|    Keybindings                                                         {{{
"|===========================================================================
" Provisional
nnoremap <CR> G
nnoremap <BS> gg
map q: :q

" Main
let mapleader = " "
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
exec "set <PageUp>=\<Esc>[5;*~"
exec "set <PageDown>=\<Esc>[6;*~"
nmap    <silent>    <leader>w :set nolist!<CR>
nmap    <silent>    <leader>b :TagbarToggle<CR>
nmap    <silent>    <leader>. :CtrlPTag<CR>
nmap    <silent>    <leader>t :NERDTreeToggle<CR>
nmap    <silent>    <leader>p :CtrlP<CR>
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
map     <C-_>       :pop<CR>
imap    <C-_>       <C-o>:pop<CR>

vmap    <silent> ,y "xy:wviminfo! ~/.viminfo<CR>
nmap    <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" Hexmode mappings
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <C-o>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

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

" System clipboard interaction
"noremap <silent> <leader>y "+y
"noremap <silent> <leader>yy "+Y
"noremap <silent> <leader>p :set paste<CR>:put +<CR>:set nopaste<CR>
" }}} "

"|    Functions                                                           {{{
"|===========================================================================
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

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.bin,*.hex setlocal binary

    " if on a fresh read the buffer variable is already set, it's wrong
    au BufReadPost *
          \ if exists('b:editHex') && b:editHex |
          \   let b:editHex = 0 |
          \ endif

    " convert to hex on startup for binary files automatically
    au BufReadPost *
          \ if &binary | Hexmode | endif

    " When the text is freed, the next time the buffer is made active it will
    " re-read the text and thus not match the correct mode, we will need to
    " convert it again if the buffer is again loaded.
    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
          \ endif

    " before writing a file when editing in hex mode, convert back to non-hex
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    " after writing a binary file, if we're in hex mode, restore hex mode
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif
" }}} "

" vim: set ft=vim fdm=marker :
