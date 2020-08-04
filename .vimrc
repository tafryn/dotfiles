"|    Plugins                                                             {{{
"|===========================================================================
call plug#begin('~/.vim/bundle')

" Additional Capabilities
Plug 'Konfekt/FastFold'
Plug 'vhdirk/vim-cmake'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tafryn/vim-tmux-navigator', { 'branch': 'forward-script' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar', { 'do': 'sed -i -e \"s/SpecialKey/Keyword/\" ./syntax/tagbar.vim' }
Plug 'sjl/gundo.vim'
Plug 'fidian/hexmode'
Plug 'tpope/vim-fugitive'
Plug 'tafryn/gv.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-repeat'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-sensible'

" Linting & Completions
Plug 'w0rp/ale'
Plug 'wellle/tmux-complete.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Interface Customization
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/Colorizer', { 'on': ['ColorHighlight'] }
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key'

" Text Manipulation & Navigation
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround'
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
Plug 'tafryn/clever-f.vim'

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
let g:ale_linters = {
\    'cpp': ['clangtidy', 'clangcheck'],
\}

let g:fastfold_fold_command_suffixes = []

let g:limelight_conceal_ctermfg = 'darkgray'
let g:limelight_conceal_guifg = 'darkslategray'

let g:ansible_unindent_after_newline = 1

let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#enabled = 0

let g:tmuxcomplete#trigger = ''

let g:highlightedyank_highlight_duration = 750

let g:gv_horizontal = 1

let g:tmux_navigator_forward_script = "nested_navigate.sh"

let g:gutentags_ctags_exclude = ["build*", "os*", "compile_commands.json"]

let g:goyo_width = 100

let g:clever_f_not_overwrites_standard_mappings = 1
let g:clever_f_smart_case = 1
let g:clever_f_mark_cursor_color = "DiffText"
let g:clever_f_mark_char_color = "WarningMsg"
let g:clever_f_fix_key_direction = 1
" let g:clever_f_timeout_ms = 1000

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
            \ 'Whitespace': { 'guifg': '808080', 'guibg': 'af0000', 'ctermfg': 'Dark Red', 'ctermbg': '', 'attr': '' },
            \ 'Pmenu': { 'guifg': '668799', 'guibg': '1f1f1f', 'ctermfg': 'Dark Red', 'ctermbg': '', 'attr': '' },
            \}
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
let g:xml_syntax_folding=1
set nowrapscan
set nodigraph
set clipboard=unnamedplus
let g:netrw_browsex_viewer = "xdg-open"
set viminfo='16,<256,h,r/tmp

" }}} "

"|    Environment Setup                                                   {{{
"|===========================================================================
set undodir=~/.vim/tmp//,/var/tmp//,/tmp//
set backupdir=~/.vim/tmp//,/var/tmp//,/tmp//
set directory=~/.vim/tmp//,/var/tmp//,/tmp//
set nojoinspaces
set wildmenu
set foldmethod=syntax
set mouse=a
set splitbelow
set splitright
set updatetime=250
set foldnestmax=4
set linebreak
set helplang=en
set printoptions=paper:letter

" Spellcheck current word
set keywordprg=c

" Cursor behavior
set nostartofline
set showmatch

" Interface display modification
set number
set showcmd
set title
set visualbell
set noshowmode
set nocursorline
set termguicolors

" Standardized indentation
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set smartindent

" For a better search
set ignorecase
set smartcase
set hlsearch
set gdefault

" File read/write options
set modeline
set suffixes=.bak,~,.swp,.o,.hi,.a,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set wildignore+=a.out,*.pyc,*.class,.git,*.o,*.a,*.hi,*.swp,*.jpg,*.png,*.xpm,*.gif
filetype on
filetype indent on
filetype plugin on
set wildignorecase

" }}} "

"|    Keybindings                                                         {{{
"|===========================================================================

" Removing
" noremap <silent> <leader>p :set paste<CR>:put +<CR>:set nopaste<CR>

" WhichKey menu for rarely used commands
let g:which_key_menu = {}
let g:which_key_menu = {
            \ 'name' : 'Quick Menu',
            \ 'b' : [':Bdelete hidden',             'close-hidden-buffers'],
            \ 'c' : [':g/^\s*\/\*/foldc',           'fold-comments'],
            \ 'd' : ['<Plug>(dirvish_up)',          'directory-view'],
            \ 'g' : ['Rg',                          'grep-repo'],
            \ 'h' : ['HexokinaseToggle',            'toggle-color-preview'],
            \ 'H' : ['Hexmode',                     'hexmode'],
            \ 'i' : ['IdentifyHighlightGroup()',    'identify-highlight'],
            \ 'l' : [':Limelight!!',                'toggle-limelight'],
            \ 'p' : ['GlobalPaste()',               'global-paste'],
            \ 'q' : ['',                            'cancel'],
            \ 's' : ['`[v`]',                       'select-pasted'],
            \ 't' : ['TagbarToggle',                'tagbar'],
            \ 'u' : ['GundoToggle',                 'undo-history'],
            \ 'w' : [':set list!',                  'highlight-whitespace'],
            \ 'W' : ['WindowSwap#EasyWindowSwap()', 'swap-window'],
            \ 'y' : ['GlobalYank()',                'global-yank'],
            \ }

" Main
let g:mapleader = "\<Space>"
let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-w>"

exec "set <PageUp>=\<Esc>[5;*~"
exec "set <PageDown>=\<Esc>[6;*~"

" Provisional
nnoremap <silent>   <leader>            :<C-u>WhichKey '<Space>'<CR>
nnoremap <silent>   <leader>m           :<C-u>WhichKey! g:which_key_menu<CR>
vnoremap <silent>   <leader>m           :<C-u>WhichKeyVisual! g:which_key_menu<CR>
nnoremap <silent>   <leader>w           :w<CR>
nnoremap <silent>   <leader>q           :q<CR>
nnoremap <silent>   <leader>o           :only<CR>
"   Replace name in current block
nnoremap            <leader>rn           [[V%:s/<C-R>///c<left><left>
nnoremap            <leader>rw           gd[[V%:s/<C-R>///c<left><left>
"   Select pasted text
nmap                gp                  `[v`]

" LSP mappings
nnoremap   <silent>  <leader>ld          :<C-u>call CocActionAsync('jumpDefinition')<CR>
nnoremap   <silent>  <leader>lt          :<C-u>call CocActionAsync('jumpTypeDefinition')<CR>
nnoremap   <silent>  <leader>lD          :<C-u>call CocActionAsync('jumpDeclaration')<CR>
nnoremap   <silent>  <leader>li          :<C-u>call CocActionAsync('jumpImplementation')<CR>
nnoremap   <silent>  <leader>lr          :<C-u>call CocActionAsync('jumpReferences')<CR>
nnoremap   <silent>  <leader>lR          :<C-u>call CocActionAsync('rename')<CR>
nnoremap   <silent>  <F2>                :<C-u>call CocActionAsync('rename')<CR>
nnoremap   <silent>  <leader>lh          :<C-u>call <SID>show_documentation()<CR>
nnoremap   <silent>  <leader>lf          :<C-u>call CocActionAsync('format')<CR>
nnoremap   <silent>  <leader>lF          :<C-u>call CocActionAsync('formatSelected', visualmode())<CR>
nnoremap   <silent>  <leader>la          :<C-u>call CocActionAsync('codeAction')<CR>
nnoremap   <silent>  ]c                  :<C-u>call CocActionAsync('diagnosticNext')<CR>
nnoremap   <silent>  [c                  :<C-u>call CocActionAsync('diagnosticPrevious')<CR>

" Completion mappings
"   use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Motion mappings
nmap                <leader>h           <Plug>(easymotion-j)
nmap                <leader>t           <Plug>(easymotion-k)
map                 /                   <Plug>(easymotion-sn)
omap                /                   <Plug>(easymotion-tn)
map                 l                   <Plug>(easymotion-next)
map                 L                   <Plug>(easymotion-prev)
nmap     <silent>   s                   <Plug>(easymotion-s2)
nmap     <silent>   S                   <Plug>(easymotion-S2)
map                 f                   <Plug>(clever-f-f)
map                 F                   <Plug>(clever-f-F)
map                 k                   <Plug>(clever-f-t)
map                 K                   <Plug>(clever-f-T)
map                 ,                   <Plug>(clever-f-repeat-back)
nnoremap <silent>   <leader>z           :<C-u>call <SID>QuarterFocus()<CR>

" Misc plugin commands
nmap     <silent>   <leader>.           :Tags<CR>
nmap     <silent>   <leader>p           :call FzfOmniFiles()<CR>
nnoremap            <C-P>               :call FzfOmniFiles()<CR>
nnoremap            <leader>b           :Buffers<CR>

" Git related mappings
nmap                <leader>gb          :Gblame -w<CR>
nmap     <silent>   <leader>gS          :Ggrep <C-R>=expand("<cword>")<CR><CR>
nmap     <silent>   <leader>gr          <Plug>(GitGutterUndoHunk)
nmap     <silent>   <leader>go          <Plug>(GitGutterPreviewHunk)
nmap     <silent>   <leader>gn          <Plug>(GitGutterNextHunk)
nmap     <silent>   <leader>gp          <Plug>(GitGutterPrevHunk)
nmap     <silent>   <leader>gs          :Gstatus<CR>
nmap     <silent>   <leader>gh          :BCommits<CR>
nmap     <silent>   <leader>gc          :Commits<CR>
nmap     <silent>   <leader>gv          :GV<CR>
nmap     <silent>   <leader>gV          :GV!<CR>
nmap     <silent>   <leader>gH          :Glog -- %<CR>

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

" Highlight mappings
"   Toggle off current search highlights
nnoremap <silent>   <leader>s           :nohlsearch<CR>

" Text editing
noremap  <silent>   <F6>                {gq}
inoremap <silent>   <F6>                <C-o>{<C-o>gq}
map                 <F7>                :setlocal spell!<CR>
imap                <F7>                <C-o>:setlocal spell!<CR>
nnoremap <silent>   <S-F7>              z=
map                 <F8>                <Esc>{j!}fmt -71<CR>}k$
imap                <F8>                <Esc>{j!}fmt -71<CR>}k$a

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

" nnoremap            ,,                  ,
" vnoremap            ,,                  ,

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

" nnoremap            k                   t
" nnoremap            K                   T

" }}} "

"|    Functions                                                           {{{
"|===========================================================================

" coc helper functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" FZF file searching function
function! FzfOmniFiles()
    silent! !git rev-parse --is-inside-work-tree
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

function! InitFoldOpen()
    if !exists("b:iforun")
        norm zv
        let b:iforun = 1
        autocmd! CursorHold <buffer>
    endif
endfunction

function! s:QuarterFocus()
    let l:save_pos = getpos(".")
    execute "normal! 22gk"
    execute "normal! " . line(".") . "zt"
    call setpos(".", l:save_pos)
endfunction

function! GlobalYank()
    normal! "xy
    wviminfo! ~/.viminfo
endfunction

function! GlobalPaste()
    rviminfo! ~/.viminfo
    normal! "xp
endfunction

function! IdentifyHighlightGroup()
    echo 'hi<' . synIDattr(synID(line("."),col("."),1),"name") . '> '
                \. 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> '
                \. 'lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
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

  autocmd FileType gitcommit setlocal nofoldenable
  autocmd FileType git setlocal nofoldenable
endif

" }}} "

" vim: set ft=vim fdm=marker :
