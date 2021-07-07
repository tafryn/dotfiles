--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.format_on_save = false
O.auto_complete = true
O.colorscheme = "jellybeans"
O.auto_close_tree = 0
O.wrap_lines = false
O.timeoutlen = 200
O.document_highlight = false
O.leader_key = " "
O.ignore_case = true
O.smart_case = true
O.lushmode = false
O.transparent_window = true
O.hl_search = true
O.cursorline = false

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.colorizer.active = true
O.plugin.ts_playground.active = false
O.plugin.ts_fold.active = true
O.plugin.indent_line.active = false
O.plugin.zen.active = false

-- dashboard
O.dashboard.custom_header = {
  [=[⠀⠀⠀⠀⠀⡠⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⠀⠀⠀⡠⢊⠔⡐⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡅⢕⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⠀⡠⢌⢂⢑⠌⠄⠅⡡⢂⠀⠀⠀⠀⠀⠀⠀⠨⡨⠢⡡⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⢊⢌⠢⡑⢄⠅⠅⠅⡂⢂⢂⠀⠀⠀⠀⠀⠀⠨⡘⢌⠢⡊⡢⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⡑⢔⢑⢌⢢⢡⠡⡁⡂⠅⡂⠢⡀⠀⠀⠀⠀⠨⡪⡨⢪⠨⡢⡁⠀⠀⠀⠀⠀⠀⢰⡆⢀⡤⠖⠒⠒⠶⣤⠀⠀⠀⠀⢀⡤⠖⠒⠒⠒⢦⣄⠀⠀⠀⠀⣠⡴⠖⠒⠲⠶⣤⡀⠀⢹⣿⣿⡆⠀⠀⠀⠀⠀⣾⣿⡿⠀⣿⣿⣿⠀⠀⣿⣿⣷⣴⣾⣿⣿⣿⣦⣀⣴⣾⣿⣿⣿⣷⣦⠀]=],
  [=[⡊⡢⡑⠔⢅⢆⠑⡐⢄⠑⢄⢑⠐⠄⠀⠀⠀⢨⠢⡊⡆⡣⡊⡂⠀⠀⠀⠀⠀⠀⢸⡷⠉⠀⠀⠀⠀⠀⠸⣧⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠘⣆⠀⢠⡾⠁⠀⠀⠀⠀⠀⠈⢻⣆⠀⢻⣿⣿⡀⠀⠀⠀⣼⣿⣿⠁⠀⣿⣿⣿⠀⠀⣿⣿⣿⠋⠁⠀⠈⢻⣿⣿⡟⠁⠀⠀⠙⣿⣿⡇]=],
  [=[⡊⡢⡊⢎⢢⢑⠀⠐⠄⢕⠐⢄⠅⢅⢅⠀⠀⠰⡑⡕⢌⢆⠣⠅⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⣿⣤⣤⣤⣤⣤⣤⣤⣤⣿⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⠈⣿⡀⠈⢿⣿⣷⠀⠀⣰⣿⣿⠃⠀⠀⣿⣿⣿⠀⠀⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⣿⣿⡇]=],
  [=[⡪⢢⠱⡡⢣⢑⠀⠀⠈⠄⢕⢐⢑⢐⠄⢕⢀⢘⢌⢎⢪⠢⡋⡎⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠘⣿⣿⣇⢠⣿⣿⠏⠀⠀⠀⣿⣿⣿⠀⠀⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⣿⣿⡇]=],
  [=[⡪⡢⢣⢱⢡⠣ ⠀⠀⠀⠑⡐⢔⢐⢑⢐⠔⢌⢆⢇⢕⠕⡕⡂⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⢻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⠘⣿⣿⣼⣿⡟⠀⠀⠀⠀⣿⣿⣿⠀⠀⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⣿⣿⡇]=],
  [=[⡪⡸⡸⡰⡑⢭⠀⠀⠀⠀⠀⠈⡂⡢⡑⡐⡑⢔⠱⡸⡰⡱⡱⡁⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠙⠷⣤⣀⣀⣀⣤⠶⠃⠀⠀⠘⠳⣤⣀⣀⣀⣠⠶⠋⠀⠀⠀⠀⠀⠹⣿⣿⡟⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⣿⣿⡇]=],
  [=[⡪⡪⡢⡣⡣⡣ ⠀⠀⠀⠀⠀⠀⠢⠢⡑⢌⠢⡣⡑⢕⢕⢕⠅⠀⠀⠀⠀⠀⠀                                                                      ]=],
  [=[⠈⠊⡎⡎⡎⡎ ⠀⠀⠀⠀⠀⠀⠀⠑⢌⠢⢱⢘⢌⢆⢣⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⠀⠀⠈⠪⡪⡪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡪⡘⡔⡅⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
  [=[⠀⠀⠀⠀⠈⠪ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠪⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]=],
}
-- O.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "maintained"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

O.lang.clang.diagnostics.virtual_text = true
O.lang.clang.diagnostics.signs = true
O.lang.clang.diagnostics.underline = true

-- python
-- add things like O.python.linter.flake8.exec_path
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.diagnostics.signs = true
O.lang.python.diagnostics.underline = true
O.lang.python.analysis.type_checking = "off"
O.lang.python.analysis.auto_search_paths = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.linter = nil

-- php
O.lang.php.environment.php_version = "7.4"
O.lang.php.diagnostics.signs = true
O.lang.php.diagnostics.underline = true
O.lang.php.filetypes = { "php", "phtml" }
O.lang.php.format = {
  format = {
    default = "psr12",
  },
}

vim.g["neoformat_enabled_lua"] = { "stylua" }
vim.g["neoformat_lua_stylua"] = {
  args = {
    "--config-path " .. vim.fn.stdpath "config" .. "/utils/.stylua.toml",
    "--search-parent-directories",
    "--stdin-filepath",
    '"%:p"',
    "--",
    "-",
  },
  exe = "stylua",
  stdin = 1,
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
O.user_autocommands = {
  { "FileType", "qf", "set nobuflisted" },
  { "FileType", "gitcommit", "setlocal nofoldenable spell" },
  { "FileType", "git", "setlocal nofoldenable" },
  { "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
  { "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
  { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
}

-- Additional Plugins
O.custom_plugins = {
  {
    "wellle/tmux-complete.vim",
    event = "BufRead",
    requires = "hrsh7th/nvim-compe",
  },
  { "nanotech/jellybeans.vim" },
  {
    "tafryn/vim-tmux-navigator",
    branch = "forward-script",
    config = function()
      vim.g.tmux_navigator_forward_script = "nested_navigate.sh"
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      require("lv-lightspeed").config()
    end,
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeFocus", "UndotreeShow", "UndotreeToggle" },
  },

  -- Tpope-ify
  { "tpope/vim-repeat", event = "BufRead" },
  {
    "tpope/vim-surround",
    event = "BufRead",
    config = function()
      vim.api.nvim_del_keymap("n", "ds")
      vim.api.nvim_set_keymap("n", "js", "<Plug>Dsurround", {})
    end,
  },
  { "tpope/vim-unimpaired", event = "BufRead" },
  { "tpope/vim-rsi" },
  { "tpope/vim-projectionist", event = "BufRead" },

  -- Additional targets
  { "wellle/targets.vim", event = "BufRead" },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "chaoren/vim-wordmotion", event = "BufRead" },

  { "tommcdo/vim-exchange", event = "BufRead" },
  { "tommcdo/vim-lion", event = "BufRead" },
  {
    "dyng/ctrlsf.vim",
    setup = function()
      vim.g.ctrlsf_default_root = "project"
      vim.g.ctrlsf_mapping = {
        open = { "<CR>", "o" },
        openb = "O",
        split = "<C-X>",
        vsplit = "<C-V>",
        tab = "",
        tabb = "T",
        popen = "p",
        popenf = "P",
        quit = "q",
        next = "<C-H>",
        prev = "<C-T>",
        pquit = "q",
        loclist = "",
        chgmode = "M",
        stop = "<C-C>",
      }
    end,
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_title = 0
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
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
}
