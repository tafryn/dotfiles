-- Sneak requires options set prior to plugin init
vim.cmd('source ~/.config/nvim/vimscript/lv-vim-sneak/init.vim') 
require('plugins')
require('lv-globals')
require('lv-utils')
require('lv-autocommands')
require('settings')
vim.cmd('luafile ~/.config/nvim/lv-settings.lua')
require('mappings')

require('lv-nvimtree') -- Causing slow startup
vim.cmd('source ~/.config/nvim/vimscript/jellybeans/init.vim')
require('colorscheme')

require('lv-which-key')
require('lv-galaxyline')
require('lv-comment')
require('lv-compe')
require('lv-treesitter')
require('lv-gitsigns')
require('lv-telescope')
require('lv-barbar')
-- require('lv-autopairs')
require('lv-bqf')
require('lv-dashboard')

vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
vim.cmd('source ~/.config/nvim/vimscript/lv-surround/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/lv-ctrlsf/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/lv-vim-floaterm/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/lv-vim-tmux-navigator/init.vim')

-- LSP
require('lsp')
require('lsp.angular-ls')
require('lsp.bash-ls')
require('lsp.clangd')
require('lsp.css-ls')
require('lsp.dart-ls')
require('lsp.docker-ls')
require('lsp.efm-general-ls')
require('lsp.elm-ls')
require('lsp.emmet-ls')
require('lsp.graphql-ls')
require('lsp.go-ls')
require('lsp.html-ls')
require('lsp.json-ls')
require('lsp.js-ts-ls')
require('lsp.kotlin-ls')
require('lsp.latex-ls')
require('lsp.lua-ls')
require('lsp.php-ls')
require('lsp.python-ls')
require('lsp.ruby-ls')
require('lsp.rust-ls')
require('lsp.svelte-ls')
require('lsp.terraform-ls')
-- require('lsp.tailwindcss-ls')
require('lsp.vim-ls')
require('lsp.vue-ls')
require('lsp.yaml-ls')
