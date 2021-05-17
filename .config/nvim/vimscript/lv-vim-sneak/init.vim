let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#f_reset = 0
let g:sneak#t_reset = 0

nmap <expr> S sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_S'
nmap <expr> s sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_s'
nmap <expr> f sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_f'
nmap <expr> F sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_F'
nmap <expr> k sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Plug>Sneak_t'
nmap <expr> K sneak#is_sneaking() ? '<Plug>Sneak_,' : '<Plug>Sneak_T'
