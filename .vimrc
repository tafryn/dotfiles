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
call plug#begin('~/.vim/bundle')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar', { 'do': 'sed -i -e \"s/SpecialKey/Keyword/\" ./syntax/tagbar.vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive', { 'do': 'sed -i -e \"s/show-number''/show-number'', ''-w''/\" ./plugin/fugitive.vim' }
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'wesQ3/vim-windowswap'
Plug 'Konfekt/FastFold'
Plug 'vhdirk/vim-cmake'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'sjl/gundo.vim'
Plug 'tafryn/hexmode'
Plug 'junegunn/limelight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround', { 'do': 'sed -i -e \"s/ ds / js /\" ./plugin/surround.vim' }
"Plug 'CoatiSoftware/vim-sourcetrail'

" Syntax highlighting plugins
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'uarun/vim-protobuf'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tmux-plugins/vim-tmux'
Plug 'pearofducks/ansible-vim'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/tla.vim'

" Colorscheme
Plug 'nanotech/jellybeans.vim'

call plug#end()
" }}} "

"|    Plugin Configuration                                                {{{
"|===========================================================================
let g:EasyMotion_keys = 'aoeuhtnspyfgcrqvjwkmxbdi'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

let g:windowswap_map_keys = 0

let g:gitgutter_map_keys = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:fastfold_fold_command_suffixes = []

let g:limelight_conceal_ctermfg = 'darkgray'
" }}} "

"|    Theme                                                               {{{
"|===========================================================================
let g:jellybeans_overrides = {
            \ 'Folded': { 'guifg': '6c6c6c', 'guibg': '202020', 'ctermfg': '', 'ctermbg': '', 'attr': 'italic' },
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
let g:airline_theme='jellybeans'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" }}} "

"|    Probationary Options                                                {{{
"|===========================================================================
set autochdir
"set smartindent
set backupdir=~/.vim-tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
"autocmd FileType c,py,rb set formatoptions=croql
let g:xml_syntax_folding=1
set noshowmode
set updatetime=250
set splitbelow
set splitright
set foldnestmax=5
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
set tags+=./.ctags;/
filetype on
filetype indent on
filetype plugin on
set shell=/bin/bash

" CScope
if has('cscope')
  "set cscopetag
  set cscopeverbose
  set cscoperelative
  set csto=0
  set cspc=1

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  let s:cscope_database = findfile(".cscope.out", ".;")

  if s:cscope_database != ""
      exec "silent cs add " . s:cscope_database
  endif
endif

" }}} "

"|    Keybindings                                                         {{{
"|===========================================================================

" Removing
"map                 <C-t>               :tabnew<CR>:edit 
"map!                <C-t>               <C-O>:tabnew<CR><C-O>:edit 
"nnoremap            <CR>                mmG
"nnoremap            <BS>                mmgg
"nnoremap <silent>   <leader>yw          :call WindowSwap#MarkWindowSwap()<CR>
"nnoremap <silent>   <leader>pw          :call WindowSwap#DoWindowSwap()<CR>
"nmap                <Leader>n           <Plug>(easymotion-n)
"nmap                <Leader>N           <Plug>(easymotion-N)
"nmap                <Leader>s           <Plug>(easymotion-s)
"map <Leader> <Plug>(easymotion-prefix)

" Main
let mapleader = " "
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
exec "set <PageUp>=\<Esc>[5;*~"
exec "set <PageDown>=\<Esc>[6;*~"

" Provisional
nnoremap <silent>   <leader>ar          :CoatiRefresh<CR>
nnoremap <silent>   <leader>aa          :CoatiActivateToken<CR>
map q: :q
  "   Replace name in current block
nnoremap            <leader>rn           [[V%:s/<C-R>///c<left><left>
nnoremap            <leader>rw           gd[[V%:s/<C-R>///c<left><left>
"   Fold all comments
nnoremap            <leader>cf          :g/^\s*\/\*/foldc<CR><C-o>
"   Toggle off current search highlights
nnoremap <silent>   <leader>m           :nohlsearch<CR>
"   Select pasted text
nnoremap <silent>   <leader>v           `[v`]

" CScope mappings (<C-o> to return s
  " Find all references to Symbol under cursor
nmap                <leader>ss          :cs find s <C-R>=expand("<cword>")<CR><CR>
  " Find Global definition of token under cursor
nmap                <leader>sg          :cs find g <C-R>=expand("<cword>")<CR><CR>
  " Find all Calls to function under cursor
nmap                <leader>sc          :cs find c <C-R>=expand("<cword>")<CR><CR>
  " Find all instances of Text under cursor
nmap                <leader>st          :cs find t <C-R>=expand("<cword>")<CR><CR>
  " Egrep word under cursor
nmap                <leader>se          :cs find e <C-R>=expand("<cword>")<CR><CR>
  " Open filename under cursor
nmap                <leader>sf          :cs find f <C-R>=expand("<cfile>")<CR><CR>
  " Find files that include filename under cursor
nmap                <leader>si          :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  " Find functions called by function under cursor
nmap                <leader>sd          :cs find d <C-R>=expand("<cword>")<CR><CR>
  " Regenerate ctags and cscope files
map      <silent>    <F3>                :call RegenTagScope()<CR>
nnoremap            <C-]>               g<C-]>

" EasyMotion mappings
nmap                <Leader>d           <Plug>(easymotion-linebackward)
nmap                <Leader>h           <Plug>(easymotion-j)
nmap                <Leader>t           <Plug>(easymotion-k)
nmap                <Leader>n           <Plug>(easymotion-lineforward)
nmap                <Leader>w           <Plug>(easymotion-w)
nmap                <Leader>W           <Plug>(easymotion-W)
nmap                <Leader>e           <Plug>(easymotion-e)
nmap                <Leader>E           <Plug>(easymotion-E)
nmap                <Leader>b           <Plug>(easymotion-b)
nmap                <Leader>B           <Plug>(easymotion-B)
nmap                <Leader>f           <Plug>(easymotion-overwin-f)
nmap                <Leader>F           <Plug>(easymotion-F)
map                 /                   <Plug>(easymotion-sn)
omap                /                   <Plug>(easymotion-tn)
map                 l                   <Plug>(easymotion-next)
map                 L                   <Plug>(easymotion-prev)

" Misc plugin commands
nmap     <silent>   <leader>.           :Tags<CR>
nmap     <silent>   <leader>p           :call FzfOmniFiles()<CR>
nnoremap            <C-P>               :call FzfOmniFiles()<CR>
nnoremap            <C-B>               :Buffers<CR>
nnoremap            <C-L>               :Locate 
nnoremap            <C-G>               :Rg 
nnoremap <silent>   <leader>u           :GundoToggle<CR>
nmap     <silent>   <leader><leader>b   :TagbarToggle<CR>
nmap     <silent>   <leader><leader>t   :NERDTreeToggle<CR>
nnoremap <silent>   <leader><leader>sw  :call WindowSwap#EasyWindowSwap()<CR>
nmap                <leader>l           :Limelight!!<CR>

" Hexmode mappings
nnoremap            <C-X>               :Hexmode<CR>
inoremap            <C-X>               <C-o>:Hexmode<CR>
vnoremap            <C-X>               :<C-U>Hexmode<CR>

" Git related bindings
nmap                <leader>gb          :Gblame<CR>
nmap     <silent>   <leader>gS          <Plug>GitGutterStageHunk
nmap     <silent>   <leader>gr          <Plug>GitGutterUndoHunk
nmap     <silent>   <leader>go          <Plug>GitGutterPreviewHunk
nmap     <silent>   <leader>gn          <Plug>GitGutterNextHunk
nmap     <silent>   <leader>gp          <Plug>GitGutterPrevHunk
nmap     <silent>   <leader>gs          :Ggrep <C-R>=expand("<cword>")<CR><CR>
nmap     <silent>   <leader>gh          :BCommits<CR>
nmap     <silent>   <leader>gc          :Commits<CR>

" Code editing
map      <silent>   <F5>                :silent CMake<CR>:make -j8<CR>
map      <silent>   <F5>                <Esc>:silent CMake<CR>:make -j8<CR>
map                 <C-_>               :pop<CR>
imap                <C-_>               <C-o>:pop<CR>
nmap                <C-PageUp>          :copen<CR>
nmap                <C-PageDown>        :cclose<CR>
nmap                <F9>                :cp<CR>
nmap                <F10>               :cn<CR>

" Highlight extraneous whitespace
nmap     <silent>   <leader><leader>w   :set nolist!<CR>

" Text editing
map                 <F7>                :setlocal spell!<CR>
imap                <F7>                <C-o>:setlocal spell!<CR>
map                 <F8>                <Esc>{j!}fmt -71<CR>}k$
imap                <F8>                <Esc>{j!}fmt -71<CR>}k$a

" Format paragraphs
map                 <C-f>               gqip
imap                <C-f>               <C-o>gqip

" Global copy/paste
vmap     <silent>   ,y                  "xy:wviminfo! ~/.viminfo<CR>
nmap     <silent>   ,p                  :rviminfo! ~/.viminfo<CR>"xp

" Navigation cluster mods
imap                <Insert>            <Nop>
noremap             <PageUp>            <C-U>
inoremap            <PageUp>            <C-O><C-U>
noremap             <PageDown>          <C-D>
inoremap            <PageDown>          <C-O><C-D>

"" Dvorak Compensators
nnoremap            <C-D>               <C-W><C-H>
nnoremap            <C-H>               <C-W><C-J>
nnoremap            <C-T>               <C-W><C-K>
nnoremap            <C-N>               <C-W><C-L>
nnoremap <silent>   t                 :exe "resize -5"<CR>
nnoremap <silent>   h                 :exe "resize +5"<CR>
nnoremap <silent>   n                 :exe "vertical resize -5"<CR>
nnoremap <silent>   d                 :exe "vertical resize +5"<CR>

noremap             d                   h
noremap             h                   j
noremap             t                   k
noremap             n                   l

noremap             D                   ^
noremap             H                   <C-D>
noremap             T                   <C-U>
noremap             N                   $

noremap             s                   :
noremap             S                   :
noremap             j                   d
noremap             J                   D
noremap             l                   n
noremap             L                   N

nnoremap            k                   t
nnoremap            K                   T

" System clipboard interaction
"noremap <silent> <leader>y "+y
"noremap <silent> <leader>yy "+Y
"noremap <silent> <leader>p :set paste<CR>:put +<CR>:set nopaste<CR>
" }}} "

"|    Functions                                                           {{{
"|===========================================================================

" FZF file searching function
function! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GFiles
    endif
endfunction

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

nmap <leader><C-S> :call <SID>SynStack()<CR>
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

function RegenTagScope()
  let oldpath = getcwd()

  let s:ctag_database = findfile(".ctags", ".;")
  let s:ctag_dir = fnamemodify(s:ctag_database, ":p:h")
  let s:cscope_database = findfile(".cscope.out", ".;")
  let s:cscope_dir = fnamemodify(s:cscope_database, ":p:h")

  echo s:ctag_database
  echo s:ctag_dir
  echo s:cscope_database
  echo s:cscope_dir

  if s:ctag_database != ""
      exec "cd " . s:ctag_dir
      exec "!ctags -R -f " . s:ctag_database
  endif

  if s:cscope_database != ""
      exec "!cscope -Rbqf " . s:cscope_database
      exec "cs reset"
  endif

  exec "cd " . oldpath
endfun

" }}} "

"|    Auto Commands                                                       {{{
"|===========================================================================

if has("autocmd")
  augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.cc,*.h,*.cpp
                \ :call <SID>StripTrailingWhitespaces()
  augroup END

endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}} "

" vim: set ft=vim fdm=marker :
