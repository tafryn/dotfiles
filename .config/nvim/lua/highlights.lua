-- GitGutter
vim.cmd('autocmd ColorScheme * hi! link SignColumn LineNr')
vim.cmd('autocmd ColorScheme * hi! link GitGutterAdd Question')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChange Type')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeDelete Number')
vim.cmd('autocmd ColorScheme * hi! link GitGutterDelete WarningMsg')
vim.cmd('autocmd ColorScheme * hi! link GitGutterAddLineNr Question')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeLineNr Type')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeDeleteLineNr Number')
vim.cmd('autocmd ColorScheme * hi! link GitGutterDeleteLineNr WarningMsg')

-- Hop
vim.cmd('autocmd ColorScheme * hi! link HopNextKey WarningMsg')
vim.cmd('autocmd ColorScheme * hi! link HopNextKey1 Title')
vim.cmd('autocmd ColorScheme * hi! link HopNextKey2 Question')
vim.cmd('autocmd ColorScheme * hi! link HopUnmatched LineNr')

-- BarBar
vim.cmd('autocmd ColorScheme * hi! link BufferCurrent ModeMsg')
vim.cmd('autocmd ColorScheme * hi! link BufferCurrentMod Type')
vim.cmd('autocmd ColorScheme * hi! link BufferCurrentSign Operator')
vim.cmd('autocmd ColorScheme * hi! link BufferCurrentTarget WarningMsg')

vim.cmd('autocmd ColorScheme * hi! link BufferVisible CursorLineNr')
vim.cmd('autocmd ColorScheme * hi! link BufferVisibleMod StorageClass')
vim.cmd('autocmd ColorScheme * hi! link BufferVisibleSign Comment')
vim.cmd('autocmd ColorScheme * hi! link BufferVisibleTarget WarningMsg')

vim.cmd('autocmd ColorScheme * hi! link BufferInactive Comment')
vim.cmd('autocmd ColorScheme * hi! link BufferInactiveMod StorageClass')
vim.cmd('autocmd ColorScheme * hi! link BufferInactiveSign Comment')
vim.cmd('autocmd ColorScheme * hi! link BufferInactiveTarget WarningMsg')

vim.cmd('autocmd ColorScheme * hi! link BufferTabpages TabLine')
vim.cmd('autocmd ColorScheme * hi! link BufferTabpageFill TabLineFill')

-- Folds
vim.cmd("hi Folded ctermfg=green ctermbg=darkgray")

-- Misc
vim.cmd('autocmd ColorScheme * hi FloatermBorder guifg=#06989a')
vim.cmd('autocmd ColorScheme * hi! link VistaColon VistaLineNr')
vim.cmd('autocmd ColorScheme * hi! link CursorLine Visual')
vim.cmd('autocmd ColorScheme * hi! link gitblame SpecialComment')
