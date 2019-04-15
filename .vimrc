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

" Additional Capabilities
Plug 'Konfekt/FastFold'
Plug 'vhdirk/vim-cmake'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tafryn/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar', { 'do': 'sed -i -e \"s/SpecialKey/Keyword/\" ./syntax/tagbar.vim' }
Plug 'sjl/gundo.vim'
Plug 'tafryn/hexmode'
Plug 'tpope/vim-fugitive', { 'do': 'sed -i -e \"s/show-number''/show-number'', ''-w''/\" ./autoload/fugitive.vim' }
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-repeat'

" Linting & Completions
Plug 'ervandew/supertab'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do':  ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'wellle/tmux-complete.vim'

" Interface Customization
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/Colorizer', { 'on': ['ColorHighlight'] }

" Text Manipulation & Navigation
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround', { 'do': 'sed -i -e \"s/ ds / js /\" ./plugin/surround.vim' }
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'
Plug 'nelstrom/vim-visual-star-search'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-rsi'
Plug 'tommcdo/vim-exchange'

" Color-schemes & Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/tla.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'

call plug#end()
" }}} "

"|    Plugin Configuration                                                {{{
"|===========================================================================
let g:EasyMotion_keys = 'aoeuhtnspgcrvqjwkm'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" let g:EasyMotion_disable_two_key_combo = 1

let g:windowswap_map_keys = 0

let g:gitgutter_map_keys = 0

let g:ale_cpp_cppcheck_options = '--std=c++14 --inline-suppr --enable=all --suppress=toomanyconfigs -I./include -I../include'
let g:ale_cpp_cquery_cache_directory = '/tmp/cquery-cache'
let g:ale_linters = {
\    'cpp': ['clangtidy', 'clangcheck'],
\}

let g:fastfold_fold_command_suffixes = []

let g:limelight_conceal_ctermfg = 'darkgray'

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cquery.log', '--init={"cacheDirectory":"/tmp/cquery-cache/"}'],
            \ 'rust': ['rls'],
            \ 'python': ['pyls'], }
"let g:LanguageClient_rootMarkers = ['.gitignore']
let g:LanguageClient_autoStart = 1

let g:ansible_unindent_after_newline = 1

let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1

let g:tmuxcomplete#trigger = ''

let g:highlightedyank_highlight_duration = 750

let g:tmux_navigator_forward_script = "nested_navigate.sh"

" let g:sneak#use_ic_scs = 1
" let g:sneak#s_next = 1
" let g:sneak#label = 1
" let g:sneak#target_labels = "aoeuiqjkmw,.pg"
" }}} "

"|    Theme                                                               {{{
"|===========================================================================
highlight link GitGutterAdd Question
highlight link GitGutterChange Function
highlight link GitGutterDelete WarningMsg

autocmd ColorScheme * hi! link Sneak DiffChange
autocmd ColorScheme * hi! link SneakScope DiffText
autocmd ColorScheme * hi SneakLabel cterm=bold ctermbg=24 guibg=#2B5B77
autocmd ColorScheme * hi SneakLabelMask ctermfg=24 ctermbg=24 guifg=#2B5B77 guibg=#2B5B77

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
let g:jellybeans_background_color="none"
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
set termguicolors
" set autochdir
"set smartindent
set backupdir=~/.vim-tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
"autocmd FileType c,py,rb set formatoptions=croql
let g:xml_syntax_folding=1
set noshowmode
set updatetime=250
set foldnestmax=5
set relativenumber
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
set splitbelow
set splitright

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
let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-w>"

imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

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

" LanguageClient mappings
noremap  <silent>   <leader>lh          :call LanguageClient#textDocument_hover()<CR>
noremap  <silent>   <leader>ld          :call LanguageClient#textDocument_definition()<CR>
noremap  <silent>   <leader>li          :call LanguageClient#textDocument_implementation()<CR>
noremap  <silent>   <leader>lr          :call LanguageClient#textDocument_references()<CR>
noremap  <silent>   <F2>                :call LanguageClient#textDocument_rename()<CR>

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
map      <silent>   <F3>                :call RegenTagScope()<CR>
nnoremap            <C-]>               g<C-]>

" Motion mappings
nmap                <Leader>h           <Plug>(easymotion-j)
nmap                <Leader>t           <Plug>(easymotion-k)
map                 /                   <Plug>(easymotion-sn)
omap                /                   <Plug>(easymotion-tn)
map                 l                   <Plug>(easymotion-next)
map                 L                   <Plug>(easymotion-prev)
nmap     <silent>   s                   <Plug>(easymotion-s2)
nmap     <silent>   S                   <Plug>(easymotion-S2)

" Misc plugin commands
nmap     <silent>   <leader>.           :Tags<CR>
nmap     <silent>   <leader>p           :call FzfOmniFiles()<CR>
nnoremap            <C-P>               :call FzfOmniFiles()<CR>
nnoremap            <C-B>               :Buffers<CR>
nnoremap            <C-L>               :Locate 
nnoremap            <C-G>               :Rg<CR>
nnoremap <silent>   <leader>u           :GundoToggle<CR>
nmap     <silent>   <leader><leader>b   :TagbarToggle<CR>
nnoremap <silent>   <leader><leader>sw  :call WindowSwap#EasyWindowSwap()<CR>
nmap                <leader>L           :Limelight!!<CR>
nmap     <silent>   <leader>d           <Plug>(dirvish_up)

" Hexmode mappings
nnoremap            <C-X>               :Hexmode<CR>
inoremap            <C-X>               <C-o>:Hexmode<CR>
vnoremap            <C-X>               :<C-U>Hexmode<CR>

" Git related bindings
nmap                <leader>gb          :Gblame<CR>
nmap     <silent>   <leader>gS          :Ggrep <C-R>=expand("<cword>")<CR><CR>
nmap     <silent>   <leader>gr          <Plug>GitGutterUndoHunk
nmap     <silent>   <leader>go          <Plug>GitGutterPreviewHunk
nmap     <silent>   <leader>gn          <Plug>GitGutterNextHunk
nmap     <silent>   <leader>gp          <Plug>GitGutterPrevHunk
nmap     <silent>   <leader>gs          :Gstatus<CR>
nmap     <silent>   <leader>gh          :BCommits<CR>
nmap     <silent>   <leader>gc          :Commits<CR>
nmap     <silent>   <leader>gv          :GV<CR>

" Code editing
noremap  <silent>   <F12>               :Neoformat<CR>
inoremap <silent>   <F12>               <C-o>:Neoformat<CR>
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

" Global copy/paste
vmap     <silent>   ,y                  "xy:wviminfo! ~/.viminfo<CR>
nmap     <silent>   ,p                  :rviminfo! ~/.viminfo<CR>"xp

" Navigation cluster mods
imap                <Insert>            <Nop>
noremap             <PageUp>            <C-U>
inoremap            <PageUp>            <C-O><C-U>
noremap             <PageDown>          <C-D>
inoremap            <PageDown>          <C-O><C-D>

" Semi-colon/colon swap
nnoremap            ;                   :
vnoremap            ;                   :

nnoremap            ;;                  ;
vnoremap            ;;                  ;

nnoremap            ,,                  ,
vnoremap            ,,                  ,

"" Dvorak Compensators
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

function! InitFoldOpen()
    if !exists("b:iforun")
        norm zv
        let b:iforun = 1
        autocmd! CursorHold <buffer>
    endif
endfunction

" }}} "

"|    Auto Commands                                                       {{{
"|===========================================================================

if has("autocmd")
  augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.cc,*.h,*.cpp
                \ :call <SID>StripTrailingWhitespaces()
  augroup END

  augroup init_fold_open
    autocmd!
    autocmd BufEnter * autocmd CursorHold <buffer> call InitFoldOpen()
  augroup END

  autocmd FileType cpp set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  "autocmd! CursorHold * call LanguageClient#textDocument_hover()
  autocmd FileType gitcommit setlocal nofoldenable
endif

" }}} "

" vim: set ft=vim fdm=marker :
