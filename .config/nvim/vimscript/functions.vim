autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()

autocmd User GoyoEnter set laststatus=0 
autocmd User GoyoLeave set laststatus=2

" autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
" autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()

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

" Redraw current line 22 lines from the top of the window
function! QuarterFocus()
    let l:save_pos = getpos(".")
    execute "normal! 22gk"
    execute "normal! " . line(".") . "zt"
    call setpos(".", l:save_pos)
endfunction

" Show the highlight groups for the current cursor location
function! IdentifyHighlightGroup()
    echo 'hi<' . synIDattr(synID(line("."),col("."),1),"name") . '> '
                \. 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> '
                \. 'lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
endfunction

function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

augroup config
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.cc,*.h,*.cpp,*.rs
                \ :call <SID>StripTrailingWhitespaces()
augroup END

" TODO: move to vim-cmake plugin configuration when neovim has better support for autocmds
augroup vim-cmake-group
    autocmd User CMakeBuildFailed :cfirst
    autocmd! User CMakeBuildSucceeded CMakeClose
augroup END
