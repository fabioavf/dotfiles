-- Abyssal Horizon theme for Neovim
-- A dark, monochromatic theme inspired by deep ocean depths
-- Matches the grayscale system theme with subtle blue undertones

local M = {}

function M.setup()
  -- Color palette
  local colors = {
    bg_dark     = "#10141a",
    bg          = "#16191e",
    bg_light    = "#1a1e23",
    bg_highlight= "#2d3237",
    fg          = "#e6e8eb",
    fg_dark     = "#d2d4d7",
    gray_accent = "#7d8287",
    bright_gray = "#a5a8ad",
    deep_gray   = "#4a4e52",
    blue_gray   = "#3a3e45",
    red         = "#696e75",
    bright_red  = "#7f8388",
    purple      = "#5a5f66",
    gray        = "#4a4e52",
    slate       = "#60656b",
    comment     = "#4a4e52",
    selection   = "#23272c",
    visual      = "#2d3237",
    line_nr     = "#23272c",
    cursor      = "#a5a8ad",
    black       = "#000000",
    white       = "#ffffff",
    none        = "NONE"
  }

  -- Highlight groups
  local groups = {
    -- Base
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.gray_accent, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_light },
    Conceal = { fg = colors.comment },
    Cursor = { fg = colors.bg, bg = colors.cursor },
    CursorColumn = { bg = colors.bg_light },
    CursorLine = { bg = colors.bg_light },
    CursorLineNr = { fg = colors.gray_accent, bold = true },
    Directory = { fg = colors.gray_accent },
    DiffAdd = { fg = colors.gray_accent, bg = colors.bg_dark },
    DiffChange = { fg = colors.deep_gray, bg = colors.bg_dark },
    DiffDelete = { fg = colors.red, bg = colors.bg_dark },
    DiffText = { fg = colors.fg, bg = colors.bg_highlight },
    ErrorMsg = { fg = colors.bright_red },
    VertSplit = { fg = colors.bg_highlight },
    Folded = { fg = colors.comment, bg = colors.bg_light },
    FoldColumn = { fg = colors.comment },
    IncSearch = { fg = colors.bg, bg = colors.bright_gray },
    LineNr = { fg = colors.line_nr },
    MatchParen = { fg = colors.bright_gray, bold = true, underline = true },
    ModeMsg = { fg = colors.fg, bold = true },
    MoreMsg = { fg = colors.gray_accent },
    NonText = { fg = colors.gray },
    Pmenu = { fg = colors.fg, bg = colors.bg_light },
    PmenuSel = { fg = colors.bg, bg = colors.gray_accent },
    PmenuSbar = { bg = colors.bg_light },
    PmenuThumb = { bg = colors.gray },
    Question = { fg = colors.gray_accent },
    QuickFixLine = { fg = colors.bg, bg = colors.gray_accent },
    Search = { fg = colors.bg, bg = colors.gray_accent },
    SpecialKey = { fg = colors.gray },
    SpellBad = { fg = colors.bright_red, underline = true },
    SpellCap = { fg = colors.deep_gray, underline = true },
    SpellLocal = { fg = colors.blue_gray, underline = true },
    SpellRare = { fg = colors.purple, underline = true },
    StatusLine = { fg = colors.fg, bg = colors.bg_highlight },
    StatusLineNC = { fg = colors.gray, bg = colors.bg_light },
    TabLine = { fg = colors.comment, bg = colors.bg_light },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { fg = colors.gray_accent, bg = colors.bg },
    Title = { fg = colors.gray_accent, bold = true },
    Visual = { bg = colors.visual },
    VisualNOS = { bg = colors.selection },
    WarningMsg = { fg = colors.deep_gray },
    WildMenu = { fg = colors.bg, bg = colors.gray_accent },

    -- Syntax highlighting
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.bright_gray },
    String = { fg = colors.deep_gray },
    Character = { fg = colors.deep_gray },
    Number = { fg = colors.blue_gray },
    Boolean = { fg = colors.bright_gray },
    Float = { fg = colors.blue_gray },
    Identifier = { fg = colors.fg },
    Function = { fg = colors.gray_accent },
    Statement = { fg = colors.blue_gray },
    Conditional = { fg = colors.blue_gray },
    Repeat = { fg = colors.blue_gray },
    Label = { fg = colors.bright_gray },
    Operator = { fg = colors.gray_accent },
    Keyword = { fg = colors.blue_gray },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.purple },
    Type = { fg = colors.bright_gray },
    StorageClass = { fg = colors.deep_gray },
    Structure = { fg = colors.deep_gray },
    Typedef = { fg = colors.deep_gray },
    Special = { fg = colors.slate },
    SpecialChar = { fg = colors.slate },
    Tag = { fg = colors.gray_accent },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment, bold = true },
    Debug = { fg = colors.red },
    Underlined = { fg = colors.gray_accent, underline = true },
    Ignore = { fg = colors.gray },
    Error = { fg = colors.bright_red },
    Todo = { fg = colors.bg, bg = colors.gray_accent, bold = true },

    -- Git
    gitcommitComment = { fg = colors.comment, italic = true },
    gitcommitUntracked = { fg = colors.comment, italic = true },
    gitcommitDiscarded = { fg = colors.comment, italic = true },
    gitcommitSelected = { fg = colors.comment, italic = true },
    gitcommitUnmerged = { fg = colors.red },
    gitcommitBranch = { fg = colors.purple },
    gitcommitNoBranch = { fg = colors.purple },
    gitcommitDiscardedType = { fg = colors.red },
    gitcommitSelectedType = { fg = colors.gray_accent },
    gitcommitUntrackedFile = { fg = colors.bright_gray },
    gitcommitDiscardedFile = { fg = colors.red },
    gitcommitSelectedFile = { fg = colors.gray_accent },
    gitcommitUnmergedFile = { fg = colors.deep_gray },
    gitcommitFile = { fg = colors.fg },

    -- LSP
    DiagnosticError = { fg = colors.bright_red },
    DiagnosticWarn = { fg = colors.deep_gray },
    DiagnosticInfo = { fg = colors.gray_accent },
    DiagnosticHint = { fg = colors.blue_gray },
    DiagnosticUnderlineError = { fg = colors.bright_red, underline = true },
    DiagnosticUnderlineWarn = { fg = colors.deep_gray, underline = true },
    DiagnosticUnderlineInfo = { fg = colors.gray_accent, underline = true },
    DiagnosticUnderlineHint = { fg = colors.blue_gray, underline = true },
    LspReferenceText = { bg = colors.selection },
    LspReferenceRead = { bg = colors.selection },
    LspReferenceWrite = { bg = colors.selection },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.gray_accent, bg = colors.bg_dark },
    TelescopePromptBorder = { fg = colors.gray_accent, bg = colors.bg_dark },
    TelescopeResultsBorder = { fg = colors.gray_accent, bg = colors.bg_dark },
    TelescopePreviewBorder = { fg = colors.gray_accent, bg = colors.bg_dark },
    TelescopePromptPrefix = { fg = colors.gray_accent },
    TelescopeSelectionCaret = { fg = colors.gray_accent },
    TelescopeSelection = { fg = colors.bright_gray, bg = colors.visual },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.gray_accent, bold = true },
    NvimTreeFolderName = { fg = colors.gray_accent },
    NvimTreeFolderIcon = { fg = colors.gray_accent },
    NvimTreeEmptyFolderName = { fg = colors.gray },
    NvimTreeOpenedFolderName = { fg = colors.bright_gray },
    NvimTreeIndentMarker = { fg = colors.gray },
    NvimTreeGitDirty = { fg = colors.deep_gray },
    NvimTreeGitNew = { fg = colors.gray_accent },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeSpecialFile = { fg = colors.bright_gray, underline = true },
    NvimTreeExecFile = { fg = colors.gray_accent, bold = true },
    NvimTreeImageFile = { fg = colors.purple },

    -- Bufferline
    BufferLineFill = { bg = colors.bg_dark },
    BufferLineBackground = { fg = colors.gray, bg = colors.bg_light },
    BufferLineBufferVisible = { fg = colors.gray, bg = colors.bg_dark },
    BufferLineBufferSelected = { fg = colors.fg, bg = colors.bg, bold = true },
    BufferLineTab = { fg = colors.gray, bg = colors.bg_light },
    BufferLineTabSelected = { fg = colors.gray_accent, bg = colors.bg },
    BufferLineTabClose = { fg = colors.red, bg = colors.bg_dark },
    BufferLineIndicatorSelected = { fg = colors.gray_accent, bg = colors.bg },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.gray_accent },
  }

  -- Apply highlights
  for group, styles in pairs(groups) do
    vim.api.nvim_set_hl(0, group, styles)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.deep_gray
  vim.g.terminal_color_3 = colors.gray_accent
  vim.g.terminal_color_4 = colors.blue_gray
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.slate
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_gray
  vim.g.terminal_color_11 = colors.bright_gray
  vim.g.terminal_color_12 = colors.gray_accent
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.deep_gray
  vim.g.terminal_color_15 = colors.white
end

return M
