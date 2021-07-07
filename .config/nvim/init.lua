require "default-config"
-- require "keymappings"
vim.cmd("luafile " .. CONFIG_PATH .. "/lv-config.lua")
vim.cmd('source '..CONFIG_PATH..'/vimscript/jellybeans/init.vim') -- Must be included before colorscheme is set
require('highlights') -- Must be included before colorscheme is set
require "settings"
require "plugins"
require('mappings') -- TODO: Reconcile LunarVim mappings with personal mappings
require "lv-utils"
require "lv-galaxyline"
require "lv-treesitter"
require "lv-which-key"
require "lv-neoformat"
if O.plugin.dashboard.active then
  require("lv-dashboard").config()
end
-- TODO is there a way to do this without vimscript
vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim') -- TODO: review functions.vim for redundancies
-- TODO these gues need to be in language files
-- require "lsp"
-- if O.lang.emmet.active then
--   require "lsp.emmet-ls"
-- end
-- if O.lang.tailwindcss.active then
--   require "lsp.tailwindcss-ls"
-- end
