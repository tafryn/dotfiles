--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.visualbell = true
vim.opt.shiftround = true
vim.opt.gdefault = true
vim.opt.wildignorecase = true
vim.opt.foldopen = vim.o.foldopen .. ",jump"
vim.opt.wrapscan = false
vim.opt.linebreak = true
vim.opt.path = vim.opt.path._info.default .. "./include,include;"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_disable_italic_comment = 1

-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.rs", "*.cc", "*.h" },
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["gp"] = ":lua require('peek').Peek('definition')<CR>"
lvim.keys.normal_mode["ga"] = ":A<CR>"
lvim.keys.normal_mode["<F4>"] = ":cp<CR>"
lvim.keys.normal_mode["<F6>"] = ":cn<CR>"
lvim.keys.normal_mode["<F7>"] = ":lua vim.diagnostic.goto_prev()<CR>"
lvim.keys.normal_mode["<F9>"] = ":lua vim.diagnostic.goto_next()<CR>"
lvim.keys.normal_mode["<C-u>"] = ":lp<CR>"
lvim.keys.normal_mode["<C-e>"] = ":lne<CR>"
lvim.keys.normal_mode["<F8>"] = ":setlocal spell!<CR>"
lvim.keys.normal_mode["<S-F8>"] = "z="
lvim.keys.normal_mode["<PageUp>"] = "<C-u>"
lvim.keys.normal_mode["<PageDown>"] = "<C-d>"

vim.api.nvim_set_keymap("", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-PageDown>", ":BufferLineCycleNext<CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-S-PageUp>", ":BufferLineMovePrev<CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-S-PageDown>", ":BufferLineMoveNext<CR>", { silent = true })

lvim.keys.insert_mode["<F8>"] = "<C-o>:setlocal spell!<CR>"
lvim.keys.insert_mode["<PageUp>"] = "<C-o><C-u>"
lvim.keys.insert_mode["<PageDown>"] = "<C-o><C-d>"

-- Dvorak compensators
vim.api.nvim_set_keymap("", "d", "h", { noremap = true })
vim.api.nvim_set_keymap("", "h", "j", { noremap = true })
vim.api.nvim_set_keymap("", "t", "k", { noremap = true })
vim.api.nvim_set_keymap("", "n", "l", { noremap = true })

vim.api.nvim_set_keymap("", "D", "^", { noremap = true })
vim.api.nvim_set_keymap("", "H", "<C-D>", { noremap = true })
vim.api.nvim_set_keymap("", "T", "<C-U>", { noremap = true })
vim.api.nvim_set_keymap("", "N", "$", { noremap = true })

vim.api.nvim_set_keymap("", "j", "d", { noremap = true })
vim.api.nvim_set_keymap("", "J", "D", { noremap = true })
vim.api.nvim_set_keymap("", "l", "n", { noremap = true })
vim.api.nvim_set_keymap("", "L", "N", { noremap = true })

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["D"] = {
  name = "+Diffview",
  c = { "<cmd>DiffviewClose<CR>", "Close" },
  f = { "<cmd>DiffviewFileHistory %<CR>", "File History" },
  l = {
    '<cmd>lua require("diffview").open(vim.fn.expand("<cword>")..".."..vim.fn.expand("<cword>").."^")<CR>',
    "Cursor Commit",
  },
}

lvim.builtin.which_key.mappings["t"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Doc" }
lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Doc" }
lvim.builtin.which_key.mappings["l"]["H"] = { "<cmd>lua vim.diagnostic.hide()<cr>", "Hide Diagnostics" }
lvim.builtin.which_key.mappings["s"]["w"] = { "<cmd>Telescope grep_string<cr>", "Search Word" }
lvim.builtin.which_key.mappings["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>1<cr>", "Apply Default Code Action" }

-- -- Change theme settings
lvim.colorscheme = "gruvbox-material"

-- Tailor colorscheme
require("highlights")

vim.g.jellybeans_overrides = {
  Folded = { guifg = "6c6c6c", guibg = "202020", ctermfg = "", ctermbg = "", attr = "italic" },
  Comment = { guifg = "626262", guibg = "", ctermfg = "Grey", ctermbg = "", attr = "italic" },
  LineNr = { guifg = "605958", guibg = "262626", ctermfg = "262626", ctermbg = "", attr = "" },
  Function = { guifg = "ffd75f", guibg = "", ctermfg = "Yellow", ctermbg = "", attr = "" },
  Search = { guifg = "ff87ff", guibg = "302028", ctermfg = "Magenta", ctermbg = "", attr = "underline" },
  SpecialKey = { guifg = "808080", guibg = "af0000", ctermfg = "Dark Red", ctermbg = "", attr = "" },
  Whitespace = { guifg = "808080", guibg = "af0000", ctermfg = "Dark Red", ctermbg = "", attr = "" },
  Pmenu = { guifg = "668799", guibg = "1f1f1f", ctermfg = "Dark Red", ctermbg = "", attr = "" },
  background = { guibg = "none", ctermbg = "none", ["256ctermbg"] = "none" },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.indentlines.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.illuminate.active = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false

lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "fish",
  "http",
  "json",
  "lua",
  "make",
  "proto",
  "python",
  "rust",
  "toml",
  "yaml",
}

lvim.builtin.treesitter.highlight.enable = true

-- Enable quick closing of telescope windows
lvim.builtin.telescope.defaults.mappings = { i = { ["<esc>"] = require("telescope.actions").close } }
lvim.builtin.telescope.extensions["fzf"] = {
  fuzzy = true,
  override_generic_sorter = true,
}
lvim.builtin.telescope.on_config_done = function(telescope)
  telescope.load_extension("fzf")
end

-- Adapt default nvim-tree mappings for dvorak
local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if status_ok then
  local tree_cb = nvim_tree_config.nvim_tree_callback
  lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "n", "<CR>", "o" }, cb = tree_cb("edit") },
    { key = "d", cb = tree_cb("close_node") },
    { key = "v", cb = tree_cb("vsplit") },
  }
end

-- tmux-navigate support
require("tmux-navigate")

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cmake_format", "cmake" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetypes = { "lua" } },
  --   {
  --     command = "prettier",
  --     extra_args = { "--print-width", "100" },
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
})
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- Colorschemes
  { "nanotech/jellybeans.vim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        transparent = true,
        background = {
          dark = "dragon",
          light = "wave",
        },
      })
    end,
  },
  { "folke/twilight.nvim" },
  { "sainnhe/gruvbox-material" },
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim" },

  -- Enhancements to existing capabilities and other plugins
  {
    "monaqa/dial.nvim",
    -- event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap("", "<C-a>", "<Plug>(dial-increment)", {})
      vim.api.nvim_set_keymap("", "<C-x>", "<Plug>(dial-decrement)", {})
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
    config = function()
      require("bqf").setup({ func_map = { tab = "" } })
    end,
  },
  {
    "peterhoeg/vim-qml",
    event = "BufRead",
    ft = { "qml" },
  },
  {
    "andersevenrud/cmp-tmux",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- New Capabilities
  {
    "axelf4/vim-strip-trailing-whitespace",
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("todo-comments").setup({
        keywords = { WARN = { alt = {} } },
        highlight = { pattern = [=[.*<(KEYWORDS)(\([^):]*\))*:]=] },
        search = { pattern = [=[\b(KEYWORDS)(\(\w*\))*:]=] },
      })
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap("n", "k", "<Plug>Lightspeed_t", { silent = true })
      vim.api.nvim_set_keymap("n", "K", "<Plug>Lightspeed_T", { silent = true })
      vim.api.nvim_set_keymap("x", "k", "<Plug>Lightspeed_t", { silent = true })
      vim.api.nvim_set_keymap("x", "K", "<Plug>Lightspeed_T", { silent = true })
      vim.api.nvim_set_keymap("o", "k", "<Plug>Lightspeed_t", { silent = true })
      vim.api.nvim_set_keymap("o", "K", "<Plug>Lightspeed_T", { silent = true })
    end,
  },
  {
    "cdelledonne/vim-cmake",
    event = "BufRead",
    config = function()
      vim.g.cmake_command = "cmake3"
      vim.g.cmake_jump_on_error = 0
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "LunarVim/peek.lua",
  },

  -- Tpope-ify
  { "tpope/vim-repeat", event = "BufRead" },
  { "tpope/vim-unimpaired", event = "BufRead" },
  { "tpope/vim-rsi" },
  { "tpope/vim-projectionist" },

  -- Additional operators
  {
    "tpope/vim-surround",
    event = "BufRead",
    config = function()
      vim.api.nvim_del_keymap("n", "ds")
      vim.api.nvim_set_keymap("n", "js", "<Plug>Dsurround", {})
    end,
  },
  { "tommcdo/vim-exchange", event = "BufRead" },

  -- Additional targets
  { "wellle/targets.vim", event = "BufRead" },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "chaoren/vim-wordmotion", event = "BufRead" },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
lvim.autocommands = {
  { "FileType", { pattern = { "qf" }, command = "set nobuflisted" } },
  { "FileType", { pattern = { "gitcommit" }, command = "setlocal nofoldenable spell" } },
  { "FileType", { pattern = { "git" }, command = "setlocal nofoldenable" } },
  { "FileType", { pattern = { "lspinfo" }, command = "nnoremap <silent> <buffer> q :q<CR>" } },
  { "FileType", { pattern = { "floaterm" }, command = "nnoremap <silent> <buffer> q :q<CR>" } },
  { "BufEnter", { pattern = { "term://*" }, command = "startinsert" } },
  { "TermOpen", { pattern = { "*" }, command = "startinsert | set nonu | set nornu" } },
}
-- vim: set ts=2 sw=2 et:
