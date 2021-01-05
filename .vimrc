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
Plug 'liuchengxu/vista.vim'
Plug 'sjl/gundo.vim'
Plug 'fidian/hexmode'
Plug 'tpope/vim-fugitive'
Plug 'tafryn/gv.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-repeat'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

" Linting & Completions
Plug 'w0rp/ale'
Plug 'wellle/tmux-complete.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'CoatiSoftware/vim-sourcetrail'

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
Plug 'voldikss/vim-floaterm'

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
let g:gitgutter_highlight_linenrs = 1

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
let g:gutentags_ctags_executable = 'uctags'

let g:goyo_width = 100

let g:clever_f_not_overwrites_standard_mappings = 1
let g:clever_f_smart_case = 1
let g:clever_f_mark_cursor_color = "DiffText"
let g:clever_f_mark_char_color = "WarningMsg"
let g:clever_f_fix_key_direction = 1
" let g:clever_f_timeout_ms = 1000

let g:which_key_timeout = 250
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

let g:floaterm_autoinsert = 1
let g:floaterm_autoclose = 1
let g:floaterm_title = 0
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

let g:vista_sidebar_width = 32

let g:cmake_use_smp = 0

" }}} "

"|    Theme                                                               {{{
"|===========================================================================
" Set terminal colors from xrdb
if executable('xrdb')
  let xrdb = systemlist('xrdb -query | grep -o "[[:digit:]]\+:.*#.*" | sort -n | grep -o "#.*"')
  let g:terminal_color_0 = xrdb[0]
  let g:terminal_color_1 = xrdb[1]
  let g:terminal_color_2 = xrdb[2]
  let g:terminal_color_3 = xrdb[3]
  let g:terminal_color_4 = xrdb[4]
  let g:terminal_color_5 = xrdb[5]
  let g:terminal_color_6 = xrdb[6]
  let g:terminal_color_7 = xrdb[7]
  let g:terminal_color_8 = xrdb[8]
  let g:terminal_color_9 = xrdb[9]
  let g:terminal_color_10 = xrdb[10]
  let g:terminal_color_11 = xrdb[11]
  let g:terminal_color_12 = xrdb[12]
  let g:terminal_color_13 = xrdb[13]
  let g:terminal_color_14 = xrdb[14]
  let g:terminal_color_15 = xrdb[15]
endif

autocmd ColorScheme * hi! link GitGutterAdd Question
autocmd ColorScheme * hi! link GitGutterChange Function
autocmd ColorScheme * hi! link GitGutterChangeDelete Number
autocmd ColorScheme * hi! link GitGutterDelete WarningMsg
autocmd ColorScheme * hi! link GitGutterAddLineNr Question
autocmd ColorScheme * hi! link GitGutterChangeLineNr Function
autocmd ColorScheme * hi! link GitGutterChangeDeleteLineNr Number
autocmd ColorScheme * hi! link GitGutterDeleteLineNr WarningMsg
autocmd ColorScheme * hi! link SignColumn LineNr
autocmd ColorScheme * hi! link Sneak DiffChange
autocmd ColorScheme * hi! link SneakScope DiffText
autocmd ColorScheme * hi SneakLabel cterm=bold ctermbg=24 guibg=#2B5B77
autocmd ColorScheme * hi SneakLabelMask ctermfg=24 ctermbg=24 guifg=#2B5B77 guibg=#2B5B77
autocmd ColorScheme * hi FloatermBorder guifg=#06989a
autocmd ColorScheme * hi! link VistaColon VistaLineNr
autocmd ColorScheme * hi! link CursorLine Visual

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
set foldopen+=jump

" }}} "

"|    Environment Setup                                                   {{{
"|===========================================================================
set undodir=~/.vim/tmp//,/var/tmp//,/tmp//
set backupdir=~/.vim/tmp//,/var/tmp//,/tmp//
set directory=~/.vim/tmp//,/var/tmp//,/tmp//
set nojoinspaces
set wildmenu
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
set relativenumber
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

" Provisional
"   Select pasted text
nmap                gp                  `[v`]

" Main
let g:mapleader = "\<Space>"
let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-w>"

exec "set <PageUp>=\<Esc>[5;*~"
exec "set <PageDown>=\<Esc>[6;*~"

let g:which_key_map = {}

nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
vnoremap <leader>? y:CocSearch <C-R>"<CR><CR>
let g:which_key_map['?'] = 'search word'

" Whichkey single mappings
let g:which_key_map['='] = ['<C-w>='                , 'balance windows']
let g:which_key_map['b'] = [':Buffers'              , 'buffers']
let g:which_key_map['c'] = [':call ProjectBuild()'  , 'compile project']
let g:which_key_map['h'] = [':let @/ = ""'          , 'toggle search highlight']
let g:which_key_map['f'] = ['<Plug>(coc-format)'    , 'format']
let g:which_key_map['o'] = [':only'                 , 'fullscreen buffer']
let g:which_key_map['p'] = [':GFiles'               , 'search project files']
let g:which_key_map['q'] = [':q'                    , 'quit']
let g:which_key_map['r'] = [':Rg'                   , 'search project']
let g:which_key_map['w'] = [':w'                    , 'write']
let g:which_key_map['z'] = [':call QuarterFocus()'  , 'zoom focus']

" Whichkey (a)ction mappings
let g:which_key_map.a = {
            \ 'name' : '+actions',
            \ 'a' : [':AV'                          , 'vsplit open alternate'],
            \ 'A' : [':AS'                          , 'hsplit open alternate'],
            \ 'b' : [':Bdelete hidden'              , 'close hidden buffers'],
            \ 'B' : [':make -j8'                    , 'build'],
            \ 'c' : [':g/^\s*\/\*/foldc'            , 'fold comments'],
            \ 'C' : [':CMake'                       , 'configure cmake'],
            \ 'f' : [':Neoformat'                   , 'format buffer'],
            \ 'h' : ['<C-w>s'                       , 'split horizontal'],
            \ 'i' : ['IdentifyHighlightGroup()'     , 'identify highlight'],
            \ 'l' : [':set nocursorline!'           , 'toggle cursor line'],
            \ 'n' : [':set nonumber!'               , 'toggle line numbers'],
            \ 'p' : ['GlobalPaste()'                , 'global paste'],
            \ 'r' : [':set norelativenumber!'       , 'toggle relative line numbers'],
            \ 's' : [':setlocal spell!'             , 'toggle spellcheck'],
            \ 'S' : ['z='                           , 'suggest correction'],
            \ 'v' : ['<C-w>v'                       , 'split vertical'],
            \ 'w' : [':set list!'                   , 'toggle whitespace highlight'],
            \ 'y' : ['GlobalYank()'                 , 'global yank'],
            \ }

" Whichkey (g)it mappings
let g:which_key_map.g = {
            \ 'name' : '+git' ,
            \ 'b' : [':Gblame -w'                   , 'blame'],
            \ 'c' : [':BCommits'                    , 'buffer commits'],
            \ 'C' : [':Commits'                     , 'commits'],
            \ 'd' : [':Git diff'                    , 'diff'],
            \ 'D' : [':Gdiffsplit'                  , 'split diff'],
            \ 'l' : [':Glog -- %'                   , 'buffer log'],
            \ 'L' : [':Glog'                        , 'log'],
            \ 'n' : ['<Plug>(GitGutterNextHunk)'    , 'next hunk'],
            \ 'o' : ['<Plug>(GitGutterPreviewHunk)' , 'view original'],
            \ 'p' : ['<Plug>(GitGutterPrevHunk)'    , 'previous hunk'],
            \ 'r' : ['<Plug>(GitGutterUndoHunk)'    , 'revert'],
            \ 's' : [':Gstatus'                     , 'status'],
            \ 'v' : [':GV!'                         , 'view buffer commits'],
            \ 'V' : [':GV'                          , 'view commits'],
            \ }

" Whichkey (l)anguage server mappings
nnoremap <silent>   <leader>lh          :<C-u>call <SID>show_documentation()<CR>
let g:which_key_map.l = {
            \ 'name' : '+language server' ,
            \ '.' : ['<Plug>(coc-command-repeat)'           , 'repeat command'],
            \ ']' : ['CocNext'                              , 'coc next'],
            \ '[' : ['CocPrev'                              , 'coc prev'],
            \ 'a' : ['<Plug>(coc-codeaction'                , 'action'] ,
            \ 'A' : ['<Plug>(coc-codelens-action'           , 'codelens action'] ,
            \ 'd' : ['<Plug>(coc-definition)'               , 'definition'],
            \ 'D' : ['<Plug>(coc-declaration)'              , 'declaration'],
            \ 'f' : ['<Plug>(coc-format)'                   , 'format'],
            \ 'F' : ['<Plug>(coc-format-selected)'          , 'format selected'],
            \ 'h' : [''                                     , 'documentation'],
            \ 'i' : ['<Plug>(coc-implementation)'           , 'implementation'],
            \ 'j' : ['<Plug>(coc-float-jump)'               , 'float jump'],
            \ 'J' : ['<Plug>(coc-float-hide)'               , 'float hide'],
            \ 'l' : [':CocList -I symbols'                  , 'search symbols'],
            \ 'L' : [':CocListResume'                       , 'resume list'],
            \ 'n' : ['<Plug>(coc-diagnostic-next)'          , 'next diagnostic'],
            \ 'N' : ['<Plug>(coc-diagnostic-next-error)'    , 'next error'],
            \ 'o' : [':CocList outline'                     , 'search outline'],
            \ 'p' : ['<Plug>(coc-diagnostic-prev)'          , 'previous diagnostic'],
            \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'    , 'previous error'],
            \ 'q' : ['<Plug>(coc-fix-current)'              , 'quickfix'],
            \ 'r' : ['<Plug>(coc-references)'               , 'references'],
            \ 'R' : ['<Plug>(coc-rename)'                   , 'rename'],
            \ 't' : [':Vista finder coc'                    , 'jump to tag'],
            \ 'T' : [':Vista!!'                             , 'show tags'],
            \ 'u' : ['<Plug>(coc-references-used)'          , 'used references'],
            \ 'z' : ['<Plug>(coc-refactor)'                 , 'refactor'],
            \ }

" Whichkey (m)isc mappings
let g:which_key_map.m = {
            \ 'name' : '+misc',
            \ 'd' : ['<Plug>(dirvish_up)'           , 'directory view'],
            \ 'h' : [':HexokinaseToggle'            , 'toggle color preview'],
            \ 'H' : [':Hexmode'                     , 'hexmode'],
            \ 'g' : [':Goyo'                        , 'goyo'],
            \ 'l' : [':Limelight!!'                 , 'toggle limelight'],
            \ 'p' : ['`[v`]'                        , 'select pasted'],
            \ 'S' : [':SourcetrailActivateToken'    , 'sourcetrail'],
            \ 'u' : [':GundoToggle'                 , 'undo history'],
            \ 'W' : ['WindowSwap#EasyWindowSwap()'  , 'swap window'],
            \ }

let g:which_key_map.n = {
            \ 'name' : '+navigate',
            \ ',' : ['<Plug>(clever-f-repeat-back)' , 'clever ,'],
            \ 'f' : ['<Plug>(clever-f-f)'           , 'clever f'],
            \ 'F' : ['<Plug>(clever-f-F)'           , 'clever F'],
            \ 'k' : ['<Plug>(clever-f-t)'           , 'clever t'],
            \ 'K' : ['<Plug>(clever-f-T)'           , 'clever T'],
            \ 'h' : ['<Plug>(easymotion-j)'         , 'em down'],
            \ 't' : ['<Plug>(easymotion-k)'         , 'em up'],
            \ 's' : ['<Plug>(easymotion-s2)'        , 'em search 2'],
            \ 'S' : ['<Plug>(easymotion-s)'         , 'em search 1'],
            \ }

" Whichkey (s)earch mappings
let g:which_key_map.s = {
            \ 'name' : '+search' ,
            \ '/' : [':History/'                    , 'search history'],
            \ 'b' : [':Buffers'                     , 'buffers'],
            \ 'c' : [':BCommits'                    , 'buffer commits'],
            \ 'C' : [':Commits'                     , 'commits'],
            \ 'f' : [':GFiles'                      , 'project files'],
            \ 'F' : [':Files'                       , 'files'],
            \ 'h' : [':Helptags'                    , 'help tags'],
            \ 'H' : [':History:'                    , 'command history'],
            \ 'l' : [':Lines'                       , 'buffer lines'],
            \ 'L' : [':Rg'                          , 'project lines'],
            \ 'm' : [':Marks'                       , 'marks'],
            \ 'M' : [':Maps:'                       , 'maps'],
            \ 'S' : [':Snippets'                    , 'snippets'],
            \ 't' : [':BTags'                       , 'buffer tags'],
            \ 'T' : [':Tags'                        , 'project tags'],
            \ }

" Whichkey (t)erminal mappings
let g:which_key_map.t = {
            \ 'name' : '+terminal' ,
            \ ';' : [':15split term://$SHELL'       , 'terminal'],
            \ 'f' : [':FloatermNew fzf'             , 'fzf'],
            \ 'g' : [':FloatermNew lazygit'         , 'git'],
            \ 'd' : [':FloatermNew lazydocker'      , 'docker'],
            \ 'h' : [':FloatermNew htop'            , 'htop'],
            \ 'N' : [':FloatermNew node'            , 'node'],
            \ 'n' : [':FloatermNew nnn'             , 'nnn'],
            \ 'p' : [':FloatermNew python'          , 'python'],
            \ 'r' : [':FloatermNew ranger'          , 'ranger'],
            \ 't' : [':FloatermToggle'              , 'toggle'],
            \ 's' : [':FloatermNew ncdu'            , 'ncdu'],
            \ }

" Setup primary whichkey mapping
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent>   <leader>            :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent>   <leader>            :<C-u>WhichKeyVisual '<Space>'<CR>

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

" Misc plugin commands
nnoremap            <C-P>               :call FzfOmniFiles()<CR>

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

" Text editing
noremap  <silent>   <F6>                gwap
inoremap <silent>   <F6>                <C-o>gwap
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

if exists(":tnoremap")
    nnoremap  <silent>  <F1>                :FloatermToggle<CR>
    inoremap  <silent>  <F1>                <C-o>:FloatermToggle<CR>
    tnoremap  <silent>  <F1>                <C-\><C-n>:FloatermToggle<CR>
    nnoremap  <silent>  <F2>                :FloatermPrev<CR>
    tnoremap  <silent>  <F2>                <C-\><C-n>:FloatermPrev<CR>
    nnoremap  <silent>  <F3>                :FloatermNext<CR>
    tnoremap  <silent>  <F3>                <C-\><C-n>:FloatermNext<CR>
    nnoremap  <silent>  <F4>                :FloatermNew<CR>
    tnoremap  <silent>  <F4>                <C-\><C-n>:FloatermNew<CR>
    " tnoremap            <C-h>               <c-\><c-n><c-w>h
    " tnoremap            <C-j>               <c-\><c-n><c-w>j
    " tnoremap            <C-k>               <c-\><c-n><c-w>k
    " tnoremap            <C-l>               <c-\><c-n><c-w>l
endif

" }}} "

"|    Functions                                                           {{{
"|===========================================================================

" coc helper functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Display information about the symbol under the cursor
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

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

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

" Open the fold under the cursor after opening a file
function! InitFoldOpen()
    if !exists("b:iforun")
        norm zv
        let b:iforun = 1
        autocmd! CursorHold <buffer>
    endif
endfunction

" Redraw current line 22 lines from the top of the window
function! QuarterFocus()
    let l:save_pos = getpos(".")
    execute "normal! 22gk"
    execute "normal! " . line(".") . "zt"
    call setpos(".", l:save_pos)
endfunction

" Copy current selection and provide to other instances
function! GlobalYank()
    normal! "xy
    wviminfo! ~/.viminfo
endfunction

" Paste from inter-instance buffer
function! GlobalPaste()
    rviminfo! ~/.viminfo
    normal! "xp
endfunction

" Show the highlight groups for the current cursor location
function! IdentifyHighlightGroup()
    echo 'hi<' . synIDattr(synID(line("."),col("."),1),"name") . '> '
                \. 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> '
                \. 'lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
endfunction

let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
    if EasyMotion#is_active()
        let g:easymotion#is_active = 1
        CocDisable
    else
        if g:easymotion#is_active == 1
            let g:easymotion#is_active = 0
            CocEnable
        endif
    endif
endfunction

" Locate nearest build directory and run a build in it
function! ProjectBuild()
    if !exists("g:pbrun")
        let g:pbrun = 1
        CMake
    endif
    Dispatch
endfunction

" }}} "

"|    Auto Commands                                                       {{{
"|===========================================================================

if has("autocmd")
  augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.cc,*.h,*.cpp,*.rs
                \ :call <SID>StripTrailingWhitespaces()
    autocmd BufWinEnter *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.cc,*.h,*.cpp,*.rs
                \ setlocal foldmethod=syntax
  augroup END

  augroup init_fold_open
    autocmd!
    autocmd BufEnter * autocmd CursorHold <buffer> call InitFoldOpen()
  augroup END

  autocmd FileType gitcommit setlocal nofoldenable
  autocmd FileType git setlocal nofoldenable

  " Automatically enter insert mode when focusing terminal buffers
  if exists(":tnoremap")
      autocmd TermOpen *:$SHELL setlocal nonu
      autocmd BufWinEnter,WinEnter term://* startinsert
  endif

  " Hide status line while displaying which_key menu
  autocmd! FileType which_key
  autocmd FileType which_key set laststatus=0 noshowmode noruler
              \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

  " Disable linter when displaying easymotion hints
  autocmd TextChanged,CursorMoved * call EasyMotionCoc()

  " Set C++ commentstring to single-line comments
  autocmd FileType cpp setlocal commentstring=//%s
endif

" }}} "

" vim: set ft=vim fdm=marker :
