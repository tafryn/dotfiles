Util = {}

function Util.identify_highlight_group()
	local r, c = unpack(vim.api.nvim_win_get_cursor(0))
	local hi_name = vim.fn.synIDattr(vim.fn["synID"](r, c, 1), "name")
	local trans_name = vim.fn.synIDattr(vim.fn["synID"](r, c, 0), "name")
	local lo_name = vim.fn.synIDattr(vim.fn["synIDtrans"](vim.fn["synID"](r, c, 1)), "name")

	print(string.format("hi<%s> trans<%s> lo<%s>", hi_name, trans_name, lo_name))
end

Util.N = {}

for i, n in pairs({ 47, 68, 40, 40, 40, 21 }) do
	for _ = 1, n do
		table.insert(Util.N, i - 1)
	end
end

function Util.rgb_to_x11(r, g, b)
	local mx = math.max(r, g, b)
	local mn = math.min(r, g, b)

	if (mx - mn) * (mx + mn) <= 6250 then
		local c = 24 - math.floor((252 - (math.floor((r + g + b) / 3))) / 10)
		if 0 <= c and c <= 23 then
			return 232 + c
		end
	end

	return 16 + 36 * Util.N[r + 1] + 6 * Util.N[g + 1] + Util.N[b + 1]
end

function Util.hex2rgb(hex)
	hex = hex:gsub("#", "")
	return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

function Util.multilink(group, fg_group, bg_group)
	local fg = vim.fn.synIDattr(vim.fn["synIDtrans"](vim.fn["hlID"](fg_group)), "fg")
	local bg = vim.fn.synIDattr(vim.fn["synIDtrans"](vim.fn["hlID"](bg_group)), "bg")
	local cfg = "NONE"
	local cbg = "NONE"
	if string.match(fg, "#" .. string.rep("[0-9a-fA-F]", 6)) then
		cfg = Util.rgb_to_x11(Util.hex2rgb(fg))
	end
	if string.match(bg, "#" .. string.rep("[0-9a-fA-F]", 6)) then
		cbg = Util.rgb_to_x11(Util.hex2rgb(bg))
	end
	vim.api.nvim_command(
		"highlight! " .. group .. " guifg=" .. fg .. " ctermfg=" .. cfg .. " guibg=" .. bg .. " ctermbg=" .. cbg
	)
end

vim.cmd([[
  " GitGutter
  autocmd ColorScheme * hi! link SignColumn LineNr
  autocmd ColorScheme * hi! link GitGutterAdd Question
  autocmd ColorScheme * hi! link GitGutterChange Type
  autocmd ColorScheme * hi! link GitGutterChangeDelete Number
  autocmd ColorScheme * hi! link GitGutterDelete Constant
  autocmd ColorScheme * hi! link GitGutterAddLineNr Question
  autocmd ColorScheme * hi! link GitGutterChangeLineNr Type
  autocmd ColorScheme * hi! link GitGutterChangeDeleteLineNr Number
  autocmd ColorScheme * hi! link GitGutterDeleteLineNr WarningMsg

  " Hop
  autocmd ColorScheme * hi! link HopNextKey WarningMsg
  autocmd ColorScheme * hi! link HopNextKey1 Title
  autocmd ColorScheme * hi! link HopNextKey2 Question
  autocmd ColorScheme * hi! link HopUnmatched LineNr

  " BarBar
  autocmd ColorScheme * hi! link BufferCurrent ModeMsg
  autocmd ColorScheme * hi! link BufferCurrentMod Type
  autocmd ColorScheme * hi! link BufferCurrentSign Operator
  autocmd ColorScheme * hi! link BufferCurrentTarget WarningMsg

  autocmd ColorScheme * hi! link BufferVisible CursorLineNr
  autocmd ColorScheme * hi! link BufferVisibleMod StorageClass
  autocmd ColorScheme * hi! link BufferVisibleSign Comment
  autocmd ColorScheme * hi! link BufferVisibleTarget WarningMsg

  autocmd ColorScheme * hi! link BufferInactive Comment
  autocmd ColorScheme * hi! link BufferInactiveMod StorageClass
  autocmd ColorScheme * hi! link BufferInactiveSign Comment
  autocmd ColorScheme * hi! link BufferInactiveTarget WarningMsg

  autocmd ColorScheme * hi! link BufferTabpages TabLine
  autocmd ColorScheme * hi! link BufferTabpageFill TabLineFill

  " Folds
  hi Folded ctermfg=green ctermbg=darkgray

  " Status Line
  autocmd ColorScheme * lua Util.multilink('StatusLine', 'StatusLine', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineNC', 'StatusLineNC', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineSeparator', 'StatusLineNC', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineGit', 'Typedef', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineGitAdd', 'Question', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineGitChange', 'Type', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineGitDelete', 'Constant', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineTreeSitter', 'Title', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsHint', 'CursorLineNr', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsInformation', 'PreProc', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsError', 'WarningMsg', 'VertSplit')
  autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsWarning', 'Type', 'VertSplit')

  " Misc
  autocmd ColorScheme * hi FloatermBorder guifg=#06989a
  autocmd ColorScheme * hi! link VistaColon VistaLineNr
  autocmd ColorScheme * hi! link CursorLine Visual
  autocmd ColorScheme * hi! link gitblame SpecialComment
]])
