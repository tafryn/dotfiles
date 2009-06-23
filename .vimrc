" Auto-generated
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set printoptions=paper:letter
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set viminfo='20,\"50
" Environment Setup
set modeline
syntax enable
set showcmd
set ruler
set number
set textwidth=70
set autoindent
set foldmethod=syntax
set ts=4
set sw=4
set mouse=a
set hlsearch
set nostartofline
set wildignore+=*.pyc
hi Folded ctermfg=green ctermbg=darkgray
colo jellybeans
set timeout timeoutlen=1000 ttimeoutlen=100
"autocmd FileType c,py,rb set formatoptions=croql
" Keybindings
imap 	<Insert>	<Nop>
map 	<F8> 		<Esc>{j!}fmt -71<CR>}k$
imap 	<F8> 		<Esc>{j!}fmt -71<CR>}k$a
map		<F9>		g<C-g>
imap	<F9>		<C-O>g<C-g>
map 	<F5> 		<Esc>:w<CR>
imap 	<F5> 		<Esc>:w<CR>a
map 	<PageUp> 	<C-U>
imap 	<PageUp> 	<C-O><C-U>
map 	<PageDown> 	<C-D>
imap 	<PageDown> 	<C-O><C-D>
map		<C-t>		:tabnew<CR>:edit 
map!	<C-t>		<C-O>:tabnew<CR>:edit 
" Dvorak Compensators
no d h
no h j
no t k
no n l

no s :
no S :
no j d
no l n
no L N
" vim: set ft=vim :
