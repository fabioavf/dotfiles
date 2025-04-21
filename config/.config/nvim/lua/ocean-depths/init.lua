-- Ocean Depths theme for Neovim
-- A cool, teal theme inspired by coastal waters
-- Matches the teal/blue system theme

local M = {}

function M.setup()
  -- Color palette
  local colors = {
    bg_dark     = "#091e24",
    bg          = "#0a2c30",
    bg_light    = "#0e2830",
    bg_highlight= "#1a5e63",
    fg          = "#e6f5f7",
    fg_dark     = "#d6e6e8",
    teal        = "#3a9eaa",
    bright_teal = "#83c5d2",
    deep_teal   = "#257d87",
    blue        = "#3a5e78",
    red         = "#a5424a",
    bright_red  = "#d14f5a",
    purple      = "#7390aa",
    gray        = "#2d7d87",
    cyan        = "#6189a4",
    comment     = "#2d7d87",
    selection   = "#12404a",
    visual      = "#3a9eaa",
    line_nr     = "#12404a",
    cursor      = "#83c5d2",
    black       = "#000000",
    white       = "#ffffff",
    none        = "NONE"
  }

  -- Highlight groups
  local groups = {
    -- Base
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.teal, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_light },
    Conceal = { fg = colors.comment },
    Cursor = { fg = colors.bg, bg = colors.cursor },
    CursorColumn = { bg = colors.bg_light },
    CursorLine = { bg = colors.bg_light },
    CursorLineNr = { fg = colors.teal, bold = true },
    Directory = { fg = colors.teal },
    DiffAdd = { fg = colors.teal, bg = colors.bg_dark },
    DiffChange = { fg = colors.deep_teal, bg = colors.bg_dark },
    DiffDelete = { fg = colors.red, bg = colors.bg_dark },
    DiffText = { fg = colors.fg, bg = colors.bg_highlight },
    ErrorMsg = { fg = colors.bright_red },
    VertSplit = { fg = colors.bg_highlight },
    Folded = { fg = colors.comment, bg = colors.bg_light },
    FoldColumn = { fg = colors.comment },
    IncSearch = { fg = colors.bg, bg = colors.bright_teal },
    LineNr = { fg = colors.line_nr },
    MatchParen = { fg = colors.bright_teal, bold = true, underline = true },
    ModeMsg = { fg = colors.fg, bold = true },
    MoreMsg = { fg = colors.teal },
    NonText = { fg = colors.gray },
    Pmenu = { fg = colors.fg, bg = colors.bg_light },
    PmenuSel = { fg = colors.bg, bg = colors.teal },
    PmenuSbar = { bg = colors.bg_light },
    PmenuThumb = { bg = colors.gray },
    Question = { fg = colors.teal },
    QuickFixLine = { fg = colors.bg, bg = colors.teal },
    Search = { fg = colors.bg, bg = colors.teal },
    SpecialKey = { fg = colors.gray },
    SpellBad = { fg = colors.bright_red, underline = true },
    SpellCap = { fg = colors.deep_teal, underline = true },
    SpellLocal = { fg = colors.blue, underline = true },
    SpellRare = { fg = colors.purple, underline = true },
    StatusLine = { fg = colors.fg, bg = colors.bg_highlight },
    StatusLineNC = { fg = colors.gray, bg = colors.bg_light },
    TabLine = { fg = colors.comment, bg = colors.bg_light },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { fg = colors.teal, bg = colors.bg },
    Title = { fg = colors.teal, bold = true },
    Visual = { bg = colors.visual },
    VisualNOS = { bg = colors.selection },
    WarningMsg = { fg = colors.deep_teal },
    WildMenu = { fg = colors.bg, bg = colors.teal },

    -- Syntax highlighting
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.bright_teal },
    String = { fg = colors.deep_teal },
    Character = { fg = colors.deep_teal },
    Number = { fg = colors.blue },
    Boolean = { fg = colors.bright_teal },
    Float = { fg = colors.blue },
    Identifier = { fg = colors.fg },
    Function = { fg = colors.teal },
    Statement = { fg = colors.blue },
    Conditional = { fg = colors.blue },
    Repeat = { fg = colors.blue },
    Label = { fg = colors.bright_teal },
    Operator = { fg = colors.teal },
    Keyword = { fg = colors.blue },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.purple },
    Type = { fg = colors.bright_teal },
    StorageClass = { fg = colors.deep_teal },
    Structure = { fg = colors.deep_teal },
    Typedef = { fg = colors.deep_teal },
    Special = { fg = colors.cyan },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = colors.teal },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment, bold = true },
    Debug = { fg = colors.red },
    Underlined = { fg = colors.teal, underline = true },
    Ignore = { fg = colors.gray },
    Error = { fg = colors.bright_red },
    Todo = { fg = colors.bg, bg = colors.teal, bold = true },

    -- Git
    gitcommitComment = { fg = colors.comment, italic = true },
    gitcommitUntracked = { fg = colors.comment, italic = true },
    gitcommitDiscarded = { fg = colors.comment, italic = true },
    gitcommitSelected = { fg = colors.comment, italic = true },
    gitcommitUnmerged = { fg = colors.red },
    gitcommitBranch = { fg = colors.purple },
    gitcommitNoBranch = { fg = colors.purple },
    gitcommitDiscardedType = { fg = colors.red },
    gitcommitSelectedType = { fg = colors.teal },
    gitcommitUntrackedFile = { fg = colors.bright_teal },
    gitcommitDiscardedFile = { fg = colors.red },
    gitcommitSelectedFile = { fg = colors.teal },
    gitcommitUnmergedFile = { fg = colors.deep_teal },
    gitcommitFile = { fg = colors.fg },

    -- LSP
    DiagnosticError = { fg = colors.bright_red },
    DiagnosticWarn = { fg = colors.deep_teal },
    DiagnosticInfo = { fg = colors.teal },
    DiagnosticHint = { fg = colors.blue },
    DiagnosticUnderlineError = { fg = colors.bright_red, underline = true },
    DiagnosticUnderlineWarn = { fg = colors.deep_teal, underline = true },
    DiagnosticUnderlineInfo = { fg = colors.teal, underline = true },
    DiagnosticUnderlineHint = { fg = colors.blue, underline = true },
    LspReferenceText = { bg = colors.selection },
    LspReferenceRead = { bg = colors.selection },
    LspReferenceWrite = { bg = colors.selection },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.teal, bg = colors.bg_dark },
    TelescopePromptBorder = { fg = colors.teal, bg = colors.bg_dark },
    TelescopeResultsBorder = { fg = colors.teal, bg = colors.bg_dark },
    TelescopePreviewBorder = { fg = colors.teal, bg = colors.bg_dark },
    TelescopePromptPrefix = { fg = colors.teal },
    TelescopeSelectionCaret = { fg = colors.teal },
    TelescopeSelection = { fg = colors.bright_teal, bg = colors.visual },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.teal, bold = true },
    NvimTreeFolderName = { fg = colors.teal },
    NvimTreeFolderIcon = { fg = colors.teal },
    NvimTreeEmptyFolderName = { fg = colors.gray },
    NvimTreeOpenedFolderName = { fg = colors.bright_teal },
    NvimTreeIndentMarker = { fg = colors.gray },
    NvimTreeGitDirty = { fg = colors.deep_teal },
    NvimTreeGitNew = { fg = colors.teal },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeSpecialFile = { fg = colors.bright_teal, underline = true },
    NvimTreeExecFile = { fg = colors.teal, bold = true },
    NvimTreeImageFile = { fg = colors.purple },

    -- Bufferline
    BufferLineFill = { bg = colors.bg_dark },
    BufferLineBackground = { fg = colors.gray, bg = colors.bg_light },
    BufferLineBufferVisible = { fg = colors.gray, bg = colors.bg_dark },
    BufferLineBufferSelected = { fg = colors.fg, bg = colors.bg, bold = true },
    BufferLineTab = { fg = colors.gray, bg = colors.bg_light },
    BufferLineTabSelected = { fg = colors.teal, bg = colors.bg },
    BufferLineTabClose = { fg = colors.red, bg = colors.bg_dark },
    BufferLineIndicatorSelected = { fg = colors.teal, bg = colors.bg },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.teal },
  }

  -- Apply highlights
  for group, styles in pairs(groups) do
    vim.api.nvim_set_hl(0, group, styles)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.deep_teal
  vim.g.terminal_color_3 = colors.teal
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_teal
  vim.g.terminal_color_11 = colors.bright_teal
  vim.g.terminal_color_12 = colors.teal
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.deep_teal
  vim.g.terminal_color_15 = colors.white
end

return M
