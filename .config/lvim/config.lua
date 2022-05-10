--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "jellybeans"
lvim.lsp.diagnostics.virtual_text = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

lvim.keys.normal_mode["<S-h>"] = nil
lvim.keys.normal_mode["<S-l>"] = nil

lvim.keys.normal_mode["gp"] = "`[v`]"
lvim.keys.normal_mode["<F8>"] = ":cp<CR>"
lvim.keys.normal_mode["<F9>"] = ":cn<CR>"
lvim.keys.normal_mode["<C-u>"] = ":lp<CR>"
lvim.keys.normal_mode["<C-e>"] = ":lne<CR>"
lvim.keys.normal_mode["<F7>"] = ":setlocal spell!<CR>"
lvim.keys.normal_mode["<S-F7>"] = "z="
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<PageUp>"] = "<C-u>"
lvim.keys.normal_mode["<PageDown>"] = "<C-d>"

vim.api.nvim_set_keymap("", "<C-PageUp>", "<S-Tab>", {})
vim.api.nvim_set_keymap("", "<C-PageDown>", "<Tab>", {})

lvim.keys.insert_mode["<F7>"] = "<C-o>:setlocal spell!<CR>"
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

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Doc" }
lvim.builtin.which_key.mappings["l"]["H"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" }
lvim.builtin.which_key.mappings["s"]["w"] = { "<cmd>Telescope grep_string<cr>", "Search Word" }

lvim.builtin.which_key.mappings["d"] = { "<cmd>lua vim.diagnostic.hide()<cr>", "Hide Diagnostics" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.bufferline.options.always_show_bufferline = true

-- if you don't want all the parsers change this to a table of the ones you want
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

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Enable quick closing of telescope windows
lvim.builtin.telescope.defaults.mappings = { i = { ["<esc>"] = require("telescope.actions").close } }
lvim.builtin.telescope.extensions["fzf"] = {
	fuzzy = true,
	override_generic_sorter = true,
}
lvim.builtin.telescope.on_config_done = function(telescope)
	telescope.load_extension("fzf")
end

-- TODO: Add tmux completion to compe (this doesn't currently work)
-- lvim.builtin.compe.source.tmux = { all_panes = true, kind = "   (Tmux)" }
-- lvim.builtin.compe.keymap.values.insert_mode["<C-e>"] = nil

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

--- Additional Options ---
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.showmatch = true
vim.opt.visualbell = true
vim.opt.shiftround = true
vim.opt.gdefault = true
vim.opt.wildignorecase = true
vim.opt.foldopen = vim.o.foldopen .. ",jump"
vim.opt.wrapscan = false
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.path = vim.opt.path._info.default .. "./include,include;"

-- tmux-navigate support
require("tmux-navigate")

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
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

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "stylua", filetypes = { "lua" } },
	--   { command = "black", filetypes = { "python" } },
	--   { command = "isort", filetypes = { "python" } },
	--   {
	--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "prettier",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--print-with", "100" },
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "typescript", "typescriptreact" },
	--   },
})

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
	{ "nanotech/jellybeans.vim" },

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

	-- New Capabilities
	{
		"axelf4/vim-strip-trailing-whitespace",
		event = "BufRead",
	},
	{
		"folke/todo-comments.nvim",
		requires = "kyazdani42/nvim-web-devicons",
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

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "FileType", "qf", "set nobuflisted" },
	{ "FileType", "gitcommit", "setlocal nofoldenable spell" },
	{ "FileType", "git", "setlocal nofoldenable" },
	{ "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },
	{ "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
	{ "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
}
