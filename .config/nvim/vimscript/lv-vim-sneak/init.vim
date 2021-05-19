let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#f_reset = 0
let g:sneak#t_reset = 0

map <expr> S sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_S'
map <expr> s sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_s'
map <expr> f sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_f'
map <expr> F sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_F'
map <expr> k sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_t'
map <expr> K sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_T'
