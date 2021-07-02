"|    Settings                                                            {{{
"|===========================================================================
"let g:vimpager_passthrough = 0
set runtimepath^=~/.local/share/nvim/site/pack/packer/start/jellybeans.vim
set nomodeline

" }}} "

"|    Theme                                                               {{{
"|===========================================================================
"autocmd ColorScheme * highlight RedundantSpaces term=standout ctermbg=red guibg=red
colo jellybeans
"match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
hi Folded ctermfg=green ctermbg=darkgray
let g:jellybeans_background_color_256="none"

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
