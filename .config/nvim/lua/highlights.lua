local cmd = vim.cmd

Util = {}

Util.N = {}

for i, n in pairs { 47, 68, 40, 40, 40, 21 } do
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

-- GitGutter
cmd "autocmd ColorScheme * hi! link SignColumn LineNr"
cmd "autocmd ColorScheme * hi! link GitGutterAdd Question"
cmd "autocmd ColorScheme * hi! link GitGutterChange Type"
cmd "autocmd ColorScheme * hi! link GitGutterChangeDelete Number"
cmd "autocmd ColorScheme * hi! link GitGutterDelete Constant"
cmd "autocmd ColorScheme * hi! link GitGutterAddLineNr Question"
cmd "autocmd ColorScheme * hi! link GitGutterChangeLineNr Type"
cmd "autocmd ColorScheme * hi! link GitGutterChangeDeleteLineNr Number"
cmd "autocmd ColorScheme * hi! link GitGutterDeleteLineNr WarningMsg"

-- Hop
cmd "autocmd ColorScheme * hi! link HopNextKey WarningMsg"
cmd "autocmd ColorScheme * hi! link HopNextKey1 Title"
cmd "autocmd ColorScheme * hi! link HopNextKey2 Question"
cmd "autocmd ColorScheme * hi! link HopUnmatched LineNr"

-- BarBar
cmd "autocmd ColorScheme * hi! link BufferCurrent ModeMsg"
cmd "autocmd ColorScheme * hi! link BufferCurrentMod Type"
cmd "autocmd ColorScheme * hi! link BufferCurrentSign Operator"
cmd "autocmd ColorScheme * hi! link BufferCurrentTarget WarningMsg"

cmd "autocmd ColorScheme * hi! link BufferVisible CursorLineNr"
cmd "autocmd ColorScheme * hi! link BufferVisibleMod StorageClass"
cmd "autocmd ColorScheme * hi! link BufferVisibleSign Comment"
cmd "autocmd ColorScheme * hi! link BufferVisibleTarget WarningMsg"

cmd "autocmd ColorScheme * hi! link BufferInactive Comment"
cmd "autocmd ColorScheme * hi! link BufferInactiveMod StorageClass"
cmd "autocmd ColorScheme * hi! link BufferInactiveSign Comment"
cmd "autocmd ColorScheme * hi! link BufferInactiveTarget WarningMsg"

cmd "autocmd ColorScheme * hi! link BufferTabpages TabLine"
cmd "autocmd ColorScheme * hi! link BufferTabpageFill TabLineFill"

-- Folds
cmd "hi Folded ctermfg=green ctermbg=darkgray"

-- Status Line
cmd "autocmd ColorScheme * lua Util.multilink('StatusLine', 'StatusLine', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineNC', 'StatusLineNC', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineSeparator', 'StatusLineNC', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineGit', 'Typedef', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineGitAdd', 'Question', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineGitChange', 'Type', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineGitDelete', 'Constant', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineTreeSitter', 'Title', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsHint', 'CursorLineNr', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsInformation', 'PreProc', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsError', 'WarningMsg', 'VertSplit')"
cmd "autocmd ColorScheme * lua Util.multilink('StatusLineLspDiagnosticsWarning', 'Type', 'VertSplit')"

-- Misc
cmd "autocmd ColorScheme * hi FloatermBorder guifg=#06989a"
cmd "autocmd ColorScheme * hi! link VistaColon VistaLineNr"
cmd "autocmd ColorScheme * hi! link CursorLine Visual"
cmd "autocmd ColorScheme * hi! link gitblame SpecialComment"
