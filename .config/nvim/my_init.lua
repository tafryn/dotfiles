require('plugins')
require('lv-globals')
vim.cmd('luafile ~/.config/nvim/lv-settings.lua')
require('settings')
require('mappings')

vim.cmd('source ~/.config/nvim/vimscript/jellybeans/init.vim')
require('colorscheme')
