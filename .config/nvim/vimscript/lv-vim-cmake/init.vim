let g:cmake_command = "cmake3"
let g:cmake_jump_on_error = 0

augroup vim-cmake-group
    autocmd User CMakeBuildFailed :cfirst
    autocmd! User CMakeBuildSucceeded CMakeClose
augroup END
