"|    Settings                                                            {{{
"|===========================================================================
"let g:vimpager_passthrough = 0
set runtimepath^=~/.local/share/lunarvim/site/pack/lazy/opt/gruvbox-material
set termguicolors
set nomodeline

" }}} "

"|    Theme                                                               {{{
"|===========================================================================
"autocmd ColorScheme * highlight RedundantSpaces term=standout ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
let g:gruvbox_material_background = "hard"
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_disable_italic_comment = 1
colo gruvbox-material

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
