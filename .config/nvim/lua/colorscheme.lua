vim.cmd('let g:nvcode_termcolors=256')

vim.cmd(
[=[
if executable('xrdb') && !empty($DISPLAY)
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
]=])

vim.cmd('autocmd ColorScheme * hi! link SignColumn LineNr')
vim.cmd('autocmd ColorScheme * hi! link GitGutterAdd Question')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChange Type')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeDelete Number')
vim.cmd('autocmd ColorScheme * hi! link GitGutterDelete WarningMsg')
vim.cmd('autocmd ColorScheme * hi! link GitGutterAddLineNr Question')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeLineNr Type')
vim.cmd('autocmd ColorScheme * hi! link GitGutterChangeDeleteLineNr Number')
vim.cmd('autocmd ColorScheme * hi! link GitGutterDeleteLineNr WarningMsg')
-- vim.cmd('autocmd ColorScheme * hi! link Sneak DiffChange')
-- vim.cmd('autocmd ColorScheme * hi! link SneakScope DiffText')
-- vim.cmd('autocmd ColorScheme * hi SneakLabel cterm=bold ctermbg=24 guibg=#2B5B77')
-- vim.cmd('autocmd ColorScheme * hi SneakLabelMask ctermfg=24 ctermbg=24 guifg=#2B5B77 guibg=#2B5B77')
vim.cmd('autocmd ColorScheme * hi FloatermBorder guifg=#06989a')
vim.cmd('autocmd ColorScheme * hi! link VistaColon VistaLineNr')
vim.cmd('autocmd ColorScheme * hi! link CursorLine Visual')

vim.cmd("hi Folded ctermfg=green ctermbg=darkgray")

vim.cmd('autocmd ColorScheme * hi! link BufferCurrent ModeMsg')
vim.cmd('autocmd ColorScheme * hi! link BufferCurrentMod Type')
vim.cmd('autocmd ColorScheme * hi! link BufferCurrentSign Conceal')
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

vim.cmd('colorscheme ' .. O.colorscheme)
