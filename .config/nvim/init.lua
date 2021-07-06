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
-- TODO is there a way to do this without vimscript
vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim') -- TODO: review functions.vim for redundancies
require "lsp"
if O.lang.emmet.active then
  require "lsp.emmet-ls"
end

-- autoformat
if O.format_on_save then
  require("lv-utils").define_augroups {
    autoformat = {
      {
        "BufWritePre",
        "*",
        [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
      },
    },
  }
end
