local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use "wbthomason/packer.nvim"

  -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
  use { "neovim/nvim-lspconfig" }
  use { "kabouzeid/nvim-lspinstall", event = "BufRead" }
  -- Telescope
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "tjdevries/astronauta.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    config = [[require('lv-telescope')]],
    event = "BufEnter",
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("lv-compe").config()
    end,
  }

  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
  use { "rafamadriz/friendly-snippets", event = "InsertEnter" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Neoformat
  use { "sbdchd/neoformat" }

  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("lv-nvimtree").config()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("lv-gitsigns").config()
    end,
    event = "BufRead",
  }

  -- whichkey
  use { "folke/which-key.nvim" }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = { "telescope.nvim" },
    config = function()
      require "lv-autopairs"
    end,
  }

  -- Comments
  use {
    "terrortylor/nvim-comment",
    -- cmd = "CommentToggle",
    config = function()
      require("nvim_comment").setup({ comment_empty = false })
    end,
  }

  -- Color
  use { "christianchiarulli/nvcode-color-schemes.vim", opt = true }

  -- Icons
  use { "kyazdani42/nvim-web-devicons" }

  -- Status Line and Bufferline
  use { "glepnir/galaxyline.nvim" }

  use {
    "romgrk/barbar.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-x>", ":BufferClose<CR>", { noremap = true, silent = true })
    end,
    -- event = "BufRead",
  }

  -- Builtins, these do not load by default

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    event = "BufWinEnter",
    cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks" },
    config = function()
      require("lv-dashboard").config()
    end,
    disable = not O.plugin.dashboard.active,
    opt = true,
  }
  -- Zen Mode
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    -- event = "BufRead",
    config = function()
      require("lv-zen").config()
    end,
    disable = not O.plugin.zen.active,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
      vim.cmd "ColorizerReloadAllBuffers"
    end,
    disable = not O.plugin.colorizer.active,
  }

  -- Treesitter playground
  use {
    "nvim-treesitter/playground",
    event = "BufRead",
    disable = not O.plugin.ts_playground.active,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"

      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }

      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end,
    disable = not O.plugin.indent_line.active,
  }

  -- comments in context
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
    disable = not O.plugin.ts_context_commentstring.active,
  }

  -- Symbol Outline
  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    disable = not O.plugin.symbol_outline.active,
  }
  -- diagnostics
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    disable = not O.plugin.trouble.active,
  }

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require "dap"
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
      })
      require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
    end,
    disable = not O.plugin.debug.active,
  }

  -- Floating terminal
  use {
    "numToStr/FTerm.nvim",
    event = "BufRead",
    config = function()
      require("FTerm").setup {
        dimensions = { height = 0.8, width = 0.8, x = 0.5, y = 0.5 },
        border = "single", -- or 'double'
      }
    end,
    disable = not O.plugin.floatterm.active,
  }

  -- Use fzy for telescope
  use {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "BufRead",
    disable = not O.plugin.telescope_fzy.active,
  }

  -- Use project for telescope
  use {
    "nvim-telescope/telescope-project.nvim",
    event = "BufRead",
    setup = function () vim.cmd[[packadd telescope.nvim]] end,
    disable = not O.plugin.telescope_project.active,
  }

  -- Sane gx for netrw_gx bug
  use {
    "felipec/vim-sanegx",
    event = "BufRead",
    disable = not O.plugin.sanegx.active,
  }

  -- Lazygit
  use {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    disable = not O.plugin.lazygit.active,
  }

  -- Diffview
  use {
    "sindrets/diffview.nvim",
    event = "BufRead",
    disable = not O.plugin.diffview.active,
  }

  -- Lush Create Color Schemes
  use {
    "rktjmp/lush.nvim",
    -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
    disable = not O.plugin.lush.active,
  }

  -- Debugger management
  use {
    "Pocco81/DAPInstall.nvim",
    -- event = "BufRead",
    disable = not O.plugin.dap_install.active,
  }

  -- LANGUAGE SPECIFIC GOES HERE
  use {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      require "lv-vimtex"
    end,
  }

  -- Rust tools
  -- TODO: use lazy loading maybe?
  use {
    "simrat39/rust-tools.nvim",
    disable = not O.lang.rust.rust_tools.active,
  }

  -- Elixir
  use { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "euphoria3" } }

  -- Javascript / Typescript
  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  }
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --   },
  --   config = function()
  --     require("null-ls").setup()
  --   end,
  -- }

  -- Pretty parentheses
  use {
    "p00f/nvim-ts-rainbow",
    disable = not O.plugin.ts_rainbow.active,
  }

  -- Autotags <div>|</div>
  use {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    disable = not O.plugin.ts_autotag.active,
  }

  -- Custom semantic text objects
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    disable = not O.plugin.ts_textobjects.active,
  }

  -- Smart text objects
  use {
    "RRethy/nvim-treesitter-textsubjects",
    disable = not O.plugin.ts_textsubjects.active,
  }

  -- Text objects using hint labels
  use {
    "mfussenegger/nvim-ts-hint-textobject",
    event = "BufRead",
    disable = not O.plugin.ts_hintobjects.active,
  }

  for _, plugin in pairs(O.custom_plugins) do
    packer.use(plugin)
  end

    if O.personal_plugins then -- TODO: Move to O.custom_plugins
        -- Personal Plugins
        use {
            "wellle/tmux-complete.vim",
            event = "BufRead",
            requires = "hrsh7th/nvim-compe"
        }
        use {"nanotech/jellybeans.vim"}
        use {
            "tafryn/vim-tmux-navigator",
            branch = 'forward-script',
            config = function()
                vim.g.tmux_navigator_forward_script = "nested_navigate.sh"
            end
        }
        use {
            "ggandor/lightspeed.nvim",
            event = "BufRead",
            config = function()
                require("lv-lightspeed").config()
            end
        }

        -- Undo
        use {
            "mbbill/undotree",
            cmd = {"UndotreeFocus", "UndotreeShow", "UndotreeToggle"}
        }

        -- Tpope-ify
        use {"tpope/vim-repeat", event = "BufRead"}
        use {
            "tpope/vim-surround",
            event = "BufRead",
            config = function()
                vim.api.nvim_del_keymap("n", "ds")
                vim.api.nvim_set_keymap("n", "js", "<Plug>Dsurround", {})
            end
        }
        use {"tpope/vim-unimpaired", event = "BufRead"}
        use {"tpope/vim-rsi"}
        use {"tpope/vim-projectionist", event = "BufRead"}

        -- Additional targets
        use {"wellle/targets.vim", event = "BufRead"}
        use {"michaeljsmith/vim-indent-object", event = "BufRead"}
        use {"chaoren/vim-wordmotion", event = "BufRead"}

        use {"tommcdo/vim-exchange", event = "BufRead"}
        use {"tommcdo/vim-lion", event = "BufRead"}
        use {
            "dyng/ctrlsf.vim",
            setup = function()
                vim.g.ctrlsf_default_root = "project"
                vim.g.ctrlsf_mapping = {
                    open = {"<CR>", "o"},
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
                    stop = "<C-C>"
                }
            end
        }
        use {
            "voldikss/vim-floaterm",
            config = function()
                vim.g.floaterm_autoinsert = 1
                vim.g.floaterm_autoclose = 1
                vim.g.floaterm_title = 0
                vim.g.floaterm_width = 0.8
                vim.g.floaterm_height = 0.8
            end
        }
        use {
            "cdelledonne/vim-cmake",
            event = "BufRead",
            config = function()
                vim.g.cmake_command = "cmake3"
                vim.g.cmake_jump_on_error = 0
            end
        }
    end

end)
