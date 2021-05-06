require('plugins')
require('lv-globals')
require('lv-utils')
require('lv-autocommands')
require('settings')
vim.cmd('luafile ~/.config/nvim/lv-settings.lua')
require('mappings')

require('lv-nvimtree')
vim.cmd('source ~/.config/nvim/vimscript/jellybeans/init.vim')
require('colorscheme')

require('lv-galaxyline')
require('lv-comment')
require('lv-compe')
require('lv-treesitter')
require('lv-gitsigns')

vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- LSP
require('lsp')
require('lsp.clangd')
require('lsp.lua-ls')
