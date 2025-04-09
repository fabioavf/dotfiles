-- Fix for the Forest Green Neovim theme
-- Save this to ~/.config/nvim/lua/forest-green/init.lua

local M = {}

-- Color palette
M.colors = {
  bg = "#1a2621",
  bg_dark = "#142319",
  bg_darker = "#0e1915",
  bg_highlight = "#1f2d27",
  bg_sidebar = "#142319",
  bg_statusline = "#1a2621",
  bg_visual = "#3a785a", -- Removed alpha channel
  border = "#2d4734",
  fg = "#e8f0e3",
  fg_dark = "#7bc75f",
  fg_gutter = "#3d6046",
  fg_sidebar = "#7bc75f",
  accent = "#5da247",
  
  -- Base colors
  black = "#1a2621",
  dark_black = "#0e1915",
  red = "#a54226",
  dark_red = "#802207",
  green = "#5da247",
  dark_green = "#3d6046",
  yellow = "#9c8726",
  dark_yellow = "#7a680e",
  blue = "#2d4734",
  dark_blue = "#1f2d27",
  magenta = "#6b735a",
  dark_magenta = "#4b5141",
  cyan = "#3a785a",
  dark_cyan = "#275040",
  white = "#e8f0e3",
  dark_white = "#c9d2c1",
  
  -- Extended palette
  bright_green = "#7bc75f",
  light_green = "#8a9673",
  teal = "#4b9972",
  dark_teal = "#396f54",
  comment = "#3d6046",
  hint = "#5da247",
  info = "#4b9972",
  warning = "#9c8726",
  error = "#a54226",
  orange = "#d1734d",
  purple = "#6e5691",
  gray = "#475e50",
  light_gray = "#5b7267"
}

function M.setup()
  -- Clear highlighting
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set colorscheme name
  vim.g.colors_name = "forest-green"
  
  local highlight = function(group, opts)
    opts.bg = opts.bg or "NONE"
    opts.sp = opts.sp or "NONE"
    vim.api.nvim_set_hl(0, group, opts)
  end
  
  -- Set base highlights
  local groups = {
    -- Base UI
    Normal = { fg = M.colors.fg, bg = "NONE" },
    NormalFloat = { fg = M.colors.fg, bg = M.colors.bg_dark },
    NormalNC = { fg = M.colors.fg_dark },
    Cursor = { fg = M.colors.bg, bg = M.colors.accent },
    CursorLine = { bg = M.colors.bg_highlight },
    CursorLineNr = { fg = M.colors.bright_green },
    LineNr = { fg = M.colors.fg_gutter },
    SignColumn = { fg = M.colors.fg_gutter, bg = "NONE" },
    ColorColumn = { bg = M.colors.bg_dark },
    VertSplit = { fg = M.colors.border },
    Folded = { fg = M.colors.fg_dark, bg = M.colors.bg_highlight },
    FoldColumn = { fg = M.colors.fg_gutter },
    
    -- Status and tab lines
    StatusLine = { fg = M.colors.fg, bg = M.colors.bg_statusline },
    StatusLineNC = { fg = M.colors.fg_gutter, bg = M.colors.bg_statusline },
    TabLine = { fg = M.colors.fg_gutter, bg = M.colors.bg_statusline },
    TabLineFill = { bg = M.colors.bg_statusline },
    TabLineSel = { fg = M.colors.fg, bg = M.colors.bg },
    
    -- Search and selection
    Search = { fg = M.colors.bg, bg = M.colors.accent },
    IncSearch = { fg = M.colors.bg, bg = M.colors.bright_green },
    Visual = { bg = M.colors.bg_visual },
    VisualNOS = { bg = M.colors.bg_visual },
    Substitute = { fg = M.colors.bg, bg = M.colors.accent },
    MatchParen = { fg = M.colors.bright_green, bold = true },
    
    -- Messages
    ModeMsg = { fg = M.colors.fg_dark, bold = true },
    MoreMsg = { fg = M.colors.accent },
    ErrorMsg = { fg = M.colors.error, bold = true },
    WarningMsg = { fg = M.colors.warning, bold = true },
    
    -- Popup menu
    Pmenu = { fg = M.colors.fg, bg = M.colors.bg_dark },
    PmenuSel = { fg = M.colors.bg, bg = M.colors.accent },
    PmenuSbar = { bg = M.colors.bg_highlight },
    PmenuThumb = { bg = M.colors.fg_gutter },
    
    -- Misc
    NonText = { fg = M.colors.fg_gutter },
    SpecialKey = { fg = M.colors.dark_cyan },
    Directory = { fg = M.colors.bright_green },
    Title = { fg = M.colors.accent, bold = true },
    Conceal = { fg = M.colors.light_gray, bg = M.colors.bg },
    
    -- Syntax
    Comment = { fg = M.colors.comment, italic = true },
    Constant = { fg = M.colors.teal },
    String = { fg = M.colors.light_green },
    Character = { fg = M.colors.light_green },
    Number = { fg = M.colors.teal },
    Boolean = { fg = M.colors.bright_green },
    Float = { fg = M.colors.teal },
    Identifier = { fg = M.colors.fg },
    Function = { fg = M.colors.bright_green },
    Statement = { fg = M.colors.dark_cyan },
    Conditional = { fg = M.colors.dark_cyan },
    Repeat = { fg = M.colors.dark_cyan },
    Label = { fg = M.colors.dark_cyan },
    Operator = { fg = M.colors.dark_cyan },
    Keyword = { fg = M.colors.dark_cyan },
    Exception = { fg = M.colors.dark_cyan },
    PreProc = { fg = M.colors.accent },
    Include = { fg = M.colors.accent },
    Define = { fg = M.colors.accent },
    Macro = { fg = M.colors.accent },
    PreCondit = { fg = M.colors.accent },
    Type = { fg = M.colors.light_green },
    StorageClass = { fg = M.colors.green },
    Structure = { fg = M.colors.green },
    Typedef = { fg = M.colors.green },
    Special = { fg = M.colors.yellow },
    SpecialChar = { fg = M.colors.yellow },
    Tag = { fg = M.colors.red },
    Delimiter = { fg = M.colors.light_gray },
    SpecialComment = { fg = M.colors.comment, italic = true },
    Underlined = { fg = M.colors.accent, underline = true },
    Error = { fg = M.colors.error },
    Todo = { fg = M.colors.bg, bg = M.colors.accent, bold = true },
    
    -- Diff
    DiffAdd = { fg = M.colors.bg, bg = M.colors.green },
    DiffChange = { fg = M.colors.bg, bg = M.colors.yellow },
    DiffDelete = { fg = M.colors.bg, bg = M.colors.red },
    DiffText = { fg = M.colors.bg, bg = M.colors.bright_green },
    
    -- Git
    diffAdded = { fg = M.colors.green },
    diffChanged = { fg = M.colors.yellow },
    diffRemoved = { fg = M.colors.red },
    diffFile = { fg = M.colors.accent, bold = true },
    diffLine = { fg = M.colors.comment },
    
    -- Spelling
    SpellBad = { undercurl = true, sp = M.colors.error },
    SpellCap = { undercurl = true, sp = M.colors.warning },
    SpellLocal = { undercurl = true, sp = M.colors.info },
    SpellRare = { undercurl = true, sp = M.colors.hint },
    
    -- TreeSitter highlights
    ["@attribute"] = { fg = M.colors.accent },
    ["@boolean"] = { fg = M.colors.bright_green },
    ["@character"] = { fg = M.colors.light_green },
    ["@comment"] = { fg = M.colors.comment, italic = true },
    ["@conditional"] = { fg = M.colors.dark_cyan },
    ["@constant"] = { fg = M.colors.teal },
    ["@constant.builtin"] = { fg = M.colors.bright_green },
    ["@constant.macro"] = { fg = M.colors.accent },
    ["@constructor"] = { fg = M.colors.light_green },
    ["@error"] = { fg = M.colors.error },
    ["@exception"] = { fg = M.colors.dark_cyan },
    ["@field"] = { fg = M.colors.fg },
    ["@float"] = { fg = M.colors.teal },
    ["@function"] = { fg = M.colors.bright_green },
    ["@function.builtin"] = { fg = M.colors.green },
    ["@function.macro"] = { fg = M.colors.green },
    ["@include"] = { fg = M.colors.accent },
    ["@keyword"] = { fg = M.colors.dark_cyan },
    ["@keyword.function"] = { fg = M.colors.dark_cyan },
    ["@keyword.return"] = { fg = M.colors.dark_cyan },
    ["@label"] = { fg = M.colors.dark_cyan },
    ["@method"] = { fg = M.colors.bright_green },
    ["@namespace"] = { fg = M.colors.light_green },
    ["@number"] = { fg = M.colors.teal },
    ["@operator"] = { fg = M.colors.dark_cyan },
    ["@parameter"] = { fg = M.colors.fg, italic = true },
    ["@parameter.reference"] = { fg = M.colors.fg, italic = true },
    ["@property"] = { fg = M.colors.fg },
    ["@punctuation.delimiter"] = { fg = M.colors.light_gray },
    ["@punctuation.bracket"] = { fg = M.colors.light_gray },
    ["@punctuation.special"] = { fg = M.colors.yellow },
    ["@repeat"] = { fg = M.colors.dark_cyan },
    ["@string"] = { fg = M.colors.light_green },
    ["@string.regex"] = { fg = M.colors.yellow },
    ["@string.escape"] = { fg = M.colors.yellow },
    ["@tag"] = { fg = M.colors.red },
    ["@tag.delimiter"] = { fg = M.colors.light_gray },
    ["@tag.attribute"] = { fg = M.colors.accent },
    ["@text"] = { fg = M.colors.fg },
    ["@text.strong"] = { fg = M.colors.accent, bold = true },
    ["@text.emphasis"] = { fg = M.colors.bright_green, italic = true },
    ["@text.underline"] = { fg = M.colors.fg, underline = true },
    ["@text.strike"] = { fg = M.colors.fg, strikethrough = true },
    ["@text.title"] = { fg = M.colors.accent, bold = true },
    ["@text.literal"] = { fg = M.colors.teal },
    ["@text.uri"] = { fg = M.colors.teal, underline = true },
    ["@text.reference"] = { fg = M.colors.teal },
    ["@type"] = { fg = M.colors.light_green },
    ["@type.builtin"] = { fg = M.colors.green },
    ["@variable"] = { fg = M.colors.fg },
    ["@variable.builtin"] = { fg = M.colors.green },
    
    -- LSP highlights
    DiagnosticError = { fg = M.colors.error },
    DiagnosticWarn = { fg = M.colors.warning },
    DiagnosticInfo = { fg = M.colors.info },
    DiagnosticHint = { fg = M.colors.hint },
    DiagnosticUnderlineError = { undercurl = true, sp = M.colors.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = M.colors.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = M.colors.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = M.colors.hint },
    LspReferenceText = { bg = M.colors.bg_highlight },
    LspReferenceRead = { bg = M.colors.bg_highlight },
    LspReferenceWrite = { bg = M.colors.bg_highlight },
    LspSignatureActiveParameter = { fg = M.colors.accent, bold = true },
    
    -- Buffer line (bufferline.nvim)
    BufferLineFill = { bg = M.colors.bg_dark },
    BufferLineBackground = { fg = M.colors.fg_gutter, bg = M.colors.bg_dark },
    BufferLineBufferVisible = { fg = M.colors.fg_dark, bg = M.colors.bg_dark },
    BufferLineBufferSelected = { fg = M.colors.fg, bg = M.colors.bg, bold = true },
    BufferLineTab = { fg = M.colors.fg_gutter, bg = M.colors.bg_dark },
    BufferLineTabSelected = { fg = M.colors.fg, bg = M.colors.bg },
    BufferLineTabClose = { fg = M.colors.red, bg = M.colors.bg_dark },
    BufferLineIndicatorSelected = { fg = M.colors.accent, bg = M.colors.bg },
    BufferLineSeparator = { fg = M.colors.border, bg = M.colors.bg_dark },
    BufferLineSeparatorVisible = { fg = M.colors.border, bg = M.colors.bg_dark },
    BufferLineSeparatorSelected = { fg = M.colors.border, bg = M.colors.bg },
    
    -- NvimTree
    NvimTreeNormal = { fg = M.colors.fg_sidebar, bg = M.colors.bg_sidebar },
    NvimTreeRootFolder = { fg = M.colors.accent, bold = true },
    NvimTreeFolderName = { fg = M.colors.fg_sidebar },
    NvimTreeFolderIcon = { fg = M.colors.accent },
    NvimTreeOpenedFolderName = { fg = M.colors.bright_green },
    NvimTreeEmptyFolderName = { fg = M.colors.fg_gutter },
    NvimTreeIndentMarker = { fg = M.colors.fg_gutter },
    NvimTreeSymlink = { fg = M.colors.teal, underline = true },
    NvimTreeExecFile = { fg = M.colors.green, bold = true },
    
    -- Telescope
    TelescopeNormal = { fg = M.colors.fg, bg = M.colors.bg_dark },
    TelescopeBorder = { fg = M.colors.border, bg = M.colors.bg_dark },
    TelescopePromptBorder = { fg = M.colors.border, bg = M.colors.bg_dark },
    TelescopeResultsBorder = { fg = M.colors.border, bg = M.colors.bg_dark },
    TelescopePreviewBorder = { fg = M.colors.border, bg = M.colors.bg_dark },
    TelescopeMatching = { fg = M.colors.accent, bold = true },
    TelescopePromptPrefix = { fg = M.colors.green },
    TelescopeSelection = { fg = M.colors.fg, bg = M.colors.bg_highlight },
    TelescopeSelectionCaret = { fg = M.colors.bright_green },
    
    -- Indent Blankline
    IndentBlanklineChar = { fg = M.colors.border },
    IndentBlanklineContextChar = { fg = M.colors.accent },
    
    -- Gitsigns
    GitSignsAdd = { fg = M.colors.green },
    GitSignsChange = { fg = M.colors.yellow },
    GitSignsDelete = { fg = M.colors.red },
    
    -- Whichkey
    WhichKey = { fg = M.colors.bright_green },
    WhichKeyGroup = { fg = M.colors.accent },
    WhichKeyDesc = { fg = M.colors.fg },
    WhichKeySeparator = { fg = M.colors.comment },
    WhichKeyFloat = { bg = M.colors.bg_dark },
    
    -- Neogit
    NeogitDiffAddHighlight = { fg = M.colors.green, bg = M.colors.bg_highlight },
    NeogitDiffDeleteHighlight = { fg = M.colors.red, bg = M.colors.bg_highlight },
    NeogitDiffContextHighlight = { bg = M.colors.bg_highlight },
    NeogitHunkHeader = { fg = M.colors.fg, bg = M.colors.bg_highlight },
    NeogitHunkHeaderHighlight = { fg = M.colors.fg, bg = M.colors.bg_highlight, bold = true },
    
    -- Dashboard (alpha.nvim)
    AlphaHeader = { fg = M.colors.accent },
    AlphaButtons = { fg = M.colors.bright_green },
    
    -- Illuminate
    IlluminatedWordText = { bg = M.colors.bg_highlight },
    IlluminatedWordRead = { bg = M.colors.bg_highlight },
    IlluminatedWordWrite = { bg = M.colors.bg_highlight },
    
    -- Cmp
    CmpItemAbbr = { fg = M.colors.fg },
    CmpItemAbbrMatch = { fg = M.colors.accent, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = M.colors.accent, bold = true },
    CmpItemKind = { fg = M.colors.bright_green },
    CmpItemMenu = { fg = M.colors.fg_dark },
  }
  
  -- Set all highlights
  for group, opts in pairs(groups) do
    highlight(group, opts)
  end
  
  -- Plugins and language-specific highlights can be added here
end

-- Return the module
return M
