require('default-config')
vim.cmd('luafile ' .. CONFIG_PATH .. '/lv-config.lua')
require('settings')
require('plugins')
require('lv-autocommands')
require('mappings')
vim.cmd('source '..CONFIG_PATH..'/vimscript/jellybeans/init.vim') -- Must be included before colorscheme is set
require('highlights') -- Must be included before colorscheme is set
require('colorscheme')
require('lv-utils')
require('lv-galaxyline')
-- require('lv-telescope')
require('lv-treesitter')
require('lv-which-key')

-- TODO is there a way to do this without vimscript
vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim')

-- LSP
require('lsp')
if O.lang.emmet.active then require('lsp.emmet-ls') end
