require('lightspeed').setup{}

vim.api.nvim_set_keymap('n', 'k', "<Plug>Lightspeed_t", {silent = true})
vim.api.nvim_set_keymap('n', 'K', "<Plug>Lightspeed_T", {silent = true})
vim.api.nvim_set_keymap('x', 'k', "<Plug>Lightspeed_t", {silent = true})
vim.api.nvim_set_keymap('x', 'K', "<Plug>Lightspeed_T", {silent = true})
vim.api.nvim_set_keymap('o', 'k', "<Plug>Lightspeed_t", {silent = true})
vim.api.nvim_set_keymap('o', 'K', "<Plug>Lightspeed_T", {silent = true})
