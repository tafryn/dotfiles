"|    Settings                                                            {{{
"|===========================================================================
"let g:vimpager_passthrough = 0
set runtimepath^=~/.vim/bundle/jellybeans.vim
set nomodeline

" }}} "

"|    Theme                                                               {{{
"|===========================================================================
"autocmd ColorScheme * highlight RedundantSpaces term=standout ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
hi Folded ctermfg=green ctermbg=darkgray
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
colo jellybeans

" }}} "

"|    Keybindings                                                         {{{
"|===========================================================================
"" Dvorak Compensators
no d h
no h <C-e>
no t <C-y>
no n l

no D ^
no H <C-d>
no T <C-u>
no N $

no l n
no L N
no <BS> <C-u>

" Semi-colon/colon swap
nnoremap            ;                   :
vnoremap            ;                   :

nnoremap            ;;                  ;
vnoremap            ;;                  ;

" }}} "

" vim: set ft=vim :
