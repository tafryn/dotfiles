--[[
lvim is the global options object

Linters should be filled in as strings with either a global executable or a path to an executable
]]

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "jellybeans"

-- keymappings
lvim.leader = "space"

-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.keys.normal_mode = {
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Page down/up
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }

-- if you just want to augment the existing ones then use the utility function
require("utils").add_keymap_normal_mode({ silent = true, noremap = true }, {
	{ "gp", "`[v`]" },
	{ "<F9>", ":cp<CR>" },
	{ "<F10>", ":cn<CR>" },
	{ "<C-u>", ":lp<CR>" },
	{ "<C-e>", ":lne<CR>" },
	{ "<F7>", ":setlocal spell!<CR>" },
	{ "<S-F7>", "z=" },
	{ "<Tab>", ":BufferNext<CR>" },
	{ "<S-Tab>", ":BufferPrevious<CR>" },
	{ "<PageUp>", "<C-u>" },
	{ "<PageDown>", "<C-d>" },
})

require("utils").add_keymap_insert_mode({ silent = true, noremap = true }, {
	{ "<F7>", "<C-o>:setlocal spell!<CR>" },
	{ "<PageUp>", "<C-o><C-u>" },
	{ "<PageDown>", "<C-o><C-d>" },
})

-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

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

-- Additional Leader bindings for WhichKey
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Doc" }
lvim.builtin.which_key.mappings["l"]["H"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" }
lvim.builtin.which_key.mappings["s"]["w"] = { "<cmd>Telescope grep_string<cr>", "Search Word" }

-- Configuration for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Enable quick closing of telescope windows
lvim.builtin.telescope.defaults.mappings["i"]["<esc>"] = require("telescope.actions").close
lvim.builtin.telescope.extensions["fzf"] = {
  fuzzy = true,
  override_generic_sorter = true
}
lvim.builtin.telescope.on_config_done = function(telescope)
  telescope.load_extension('fzf')
end

-- TODO: Add tmux completion to compe (this doesn't currently work)
-- TODO: Remove compe <C-e> binding
lvim.builtin.compe.source.tmux = { all_panes = true, kind = "   (Tmux)" }

-- Adapt default nvim-tree mappings for dvorak
local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if status_ok then
	local tree_cb = nvim_tree_config.nvim_tree_callback
	vim.g.nvim_tree_bindings = {
		{ key = { "n", "<CR>", "o" }, cb = tree_cb("edit") },
		{ key = "d", cb = tree_cb("close_node") },
		{ key = "v", cb = tree_cb("vsplit") },
	}
end

-- TODO: Elimintae <S-l> and <S-h> bufferline mappings (update next time rolling is merged)
-- lvim.builtin.bufferline.keymap.normal_mode = {}

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
vim.opt.smartindent = true
vim.opt.gdefault = true
vim.opt.wildignorecase = true
vim.opt.foldopen = vim.o.foldopen .. ",jump"
vim.opt.wrapscan = false
vim.opt.linebreak = true
vim.cmd("set path+=./include,include;")

-- TODO setting foldmethod to "expr" disables treesitter and lsp by default
-- opt.foldmethod = "expr
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

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
		-- "wellle/tmux-complete.vim",
		"andersevenrud/compe-tmux",
		event = "InsertEnter",
		requires = "hrsh7th/nvim-compe",
	},
	{
		"tafryn/vim-tmux-navigator",
		branch = "forward-script",
		config = function()
			vim.g.tmux_navigator_forward_script = "nested_navigate.sh"
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
    run = 'make',
  },

	-- New Capabilities
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "InsertEnter",
	},
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
		"mbbill/undotree",
		cmd = { "UndotreeFocus", "UndotreeShow", "UndotreeToggle" },
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
	{ "tommcdo/vim-lion", event = "BufRead" },

	-- Additional targets
	{ "wellle/targets.vim", event = "BufRead" },
	{ "michaeljsmith/vim-indent-object", event = "BufRead" },
	{ "chaoren/vim-wordmotion", event = "BufRead" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
	{ "FileType", "qf", "set nobuflisted" },
	{ "FileType", "gitcommit", "setlocal nofoldenable spell" },
	{ "FileType", "git", "setlocal nofoldenable" },
	{ "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
	{ "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
	{ "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
}

-- Language specific tweaks
lvim.lang.cpp.formatter.exe = "clang-format"
lvim.lang.c.formatter.exe = "clang-format"
