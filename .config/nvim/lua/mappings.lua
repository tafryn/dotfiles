local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Select pasted text
map('n', 'gp', '`[v`]', {silent = true})

-- Completion menu navigation
-- map('i', '<Tab>'  , 'pumvisible() ? "\\<C-n>" : "\\<Tab>"'       , {expr = true})
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'     , {expr = true})
-- map('i', '<CR>'   , 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', {expr = true})
map('i', '<CR>', 'compe#confirm(\'<CR>\')', {expr = true, silent = true})

-- Better indenting
map('v', '<', '<gv', {silent = true})
map('v', '>', '>gv', {silent = true})

-- Resize with arrows
map('n', '<C-Up>'   , ':resize -2<CR>'         , {silent = true })
map('n', '<C-Down>' , ':resize +2<CR>'         , {silent = true })
map('n', '<C-Left>' , ':vertical resize -2<CR>', {silent = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true })

-- Quickfix shortcuts
map('n', '<C-q>', ':cclose<CR>', {silent = true})
map('n', '<F9>', ':cp<CR>', {})
map('n', '<F10>', ':cn<CR>', {})
map('n', '<C-u>', ':lp<CR>', {})
map('n', '<C-e>', ':lne<CR>', {})

map('n', '<PageUp>', '<C-u>', {})
map('i', '<PageUp>', '<C-o><C-u>', {})
map('n', '<PageDown>', '<C-d>', {})
map('i', '<PageDown>', '<C-o><C-d>', {})

map('n', '<F7>', ':setlocal spell!<CR>', {})
map('i', '<F7>', '<C-o>:setlocal spell!<CR>', {})
map('n', '<S-F7>', 'z=', {silent = true})

-- Semi-colon/colon swap
map('n', ';', ':')
map('v', ';', ':')
map('n', ';;', ';')
map('v', ';;', ';')

-- Dvorak compensators
map('', 'd', 'h')
map('', 'h', 'j')
map('', 't', 'k')
map('', 'n', 'l')

map('', 'D', '^')
map('', 'H', '<C-D>')
map('', 'T', '<C-U>')
map('', 'N', '$')

map('', 'j', 'd')
map('', 'J', 'D')
map('', 'l', 'n')
map('', 'L', 'N')

-- Move selected line / block of text in visual mode
map('x', 'T', ':move \'<-2<CR>gv-gv', {silent = true})
map('x', 'H', ':move \'>+1<CR>gv-gv', {silent = true})

