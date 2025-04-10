-- Amber Sands theme for Neovim
-- A warm, golden theme inspired by desert sand ripples
-- Matches the amber/gold system theme

local M = {}

function M.setup()
  -- Color palette
  local colors = {
    bg_dark     = "#19150e",
    bg          = "#1a140c",
    bg_light    = "#231914",
    bg_highlight= "#473419",
    fg          = "#f5e6c9",
    fg_dark     = "#e5d6b9",
    gold        = "#d79921",
    bright_gold = "#fabd2f",
    amber       = "#b57614",
    brown       = "#78593a",
    red         = "#a54226",
    bright_red  = "#d14f35",
    purple      = "#907389",
    gray        = "#665133",
    orange      = "#d5971a",
    comment     = "#665133",
    selection   = "#493626",
    visual      = "#d79921",
    line_nr     = "#493626",
    cursor      = "#fabd2f",
    black       = "#000000",
    white       = "#ffffff",
    none        = "NONE"
  }

  -- Highlight groups
  local groups = {
    -- Base
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.gold, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_light },
    Conceal = { fg = colors.comment },
    Cursor = { fg = colors.bg, bg = colors.cursor },
    CursorColumn = { bg = colors.bg_light },
    CursorLine = { bg = colors.bg_light },
    CursorLineNr = { fg = colors.gold, bold = true },
    Directory = { fg = colors.gold },
    DiffAdd = { fg = colors.gold, bg = colors.bg_dark },
    DiffChange = { fg = colors.amber, bg = colors.bg_dark },
    DiffDelete = { fg = colors.red, bg = colors.bg_dark },
    DiffText = { fg = colors.fg, bg = colors.bg_highlight },
    ErrorMsg = { fg = colors.bright_red },
    VertSplit = { fg = colors.bg_highlight },
    Folded = { fg = colors.comment, bg = colors.bg_light },
    FoldColumn = { fg = colors.comment },
    IncSearch = { fg = colors.bg, bg = colors.bright_gold },
    LineNr = { fg = colors.line_nr },
    MatchParen = { fg = colors.bright_gold, bold = true, underline = true },
    ModeMsg = { fg = colors.fg, bold = true },
    MoreMsg = { fg = colors.gold },
    NonText = { fg = colors.gray },
    Pmenu = { fg = colors.fg, bg = colors.bg_light },
    PmenuSel = { fg = colors.bg, bg = colors.gold },
    PmenuSbar = { bg = colors.bg_light },
    PmenuThumb = { bg = colors.gray },
    Question = { fg = colors.gold },
    QuickFixLine = { fg = colors.bg, bg = colors.gold },
    Search = { fg = colors.bg, bg = colors.gold },
    SpecialKey = { fg = colors.gray },
    SpellBad = { fg = colors.bright_red, underline = true },
    SpellCap = { fg = colors.amber, underline = true },
    SpellLocal = { fg = colors.brown, underline = true },
    SpellRare = { fg = colors.purple, underline = true },
    StatusLine = { fg = colors.fg, bg = colors.bg_highlight },
    StatusLineNC = { fg = colors.gray, bg = colors.bg_light },
    TabLine = { fg = colors.comment, bg = colors.bg_light },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { fg = colors.gold, bg = colors.bg },
    Title = { fg = colors.gold, bold = true },
    Visual = { bg = colors.visual },
    VisualNOS = { bg = colors.selection },
    WarningMsg = { fg = colors.amber },
    WildMenu = { fg = colors.bg, bg = colors.gold },

    -- Syntax highlighting
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.bright_gold },
    String = { fg = colors.amber },
    Character = { fg = colors.amber },
    Number = { fg = colors.brown },
    Boolean = { fg = colors.bright_gold },
    Float = { fg = colors.brown },
    Identifier = { fg = colors.fg },
    Function = { fg = colors.gold },
    Statement = { fg = colors.brown },
    Conditional = { fg = colors.brown },
    Repeat = { fg = colors.brown },
    Label = { fg = colors.bright_gold },
    Operator = { fg = colors.gold },
    Keyword = { fg = colors.brown },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.purple },
    Type = { fg = colors.bright_gold },
    StorageClass = { fg = colors.amber },
    Structure = { fg = colors.amber },
    Typedef = { fg = colors.amber },
    Special = { fg = colors.orange },
    SpecialChar = { fg = colors.orange },
    Tag = { fg = colors.gold },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment, bold = true },
    Debug = { fg = colors.red },
    Underlined = { fg = colors.gold, underline = true },
    Ignore = { fg = colors.gray },
    Error = { fg = colors.bright_red },
    Todo = { fg = colors.bg, bg = colors.gold, bold = true },

    -- Git
    gitcommitComment = { fg = colors.comment, italic = true },
    gitcommitUntracked = { fg = colors.comment, italic = true },
    gitcommitDiscarded = { fg = colors.comment, italic = true },
    gitcommitSelected = { fg = colors.comment, italic = true },
    gitcommitUnmerged = { fg = colors.red },
    gitcommitBranch = { fg = colors.purple },
    gitcommitNoBranch = { fg = colors.purple },
    gitcommitDiscardedType = { fg = colors.red },
    gitcommitSelectedType = { fg = colors.gold },
    gitcommitUntrackedFile = { fg = colors.bright_gold },
    gitcommitDiscardedFile = { fg = colors.red },
    gitcommitSelectedFile = { fg = colors.gold },
    gitcommitUnmergedFile = { fg = colors.amber },
    gitcommitFile = { fg = colors.fg },

    -- LSP
    DiagnosticError = { fg = colors.bright_red },
    DiagnosticWarn = { fg = colors.amber },
    DiagnosticInfo = { fg = colors.gold },
    DiagnosticHint = { fg = colors.brown },
    DiagnosticUnderlineError = { fg = colors.bright_red, underline = true },
    DiagnosticUnderlineWarn = { fg = colors.amber, underline = true },
    DiagnosticUnderlineInfo = { fg = colors.gold, underline = true },
    DiagnosticUnderlineHint = { fg = colors.brown, underline = true },
    LspReferenceText = { bg = colors.selection },
    LspReferenceRead = { bg = colors.selection },
    LspReferenceWrite = { bg = colors.selection },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.gold, bg = colors.bg_dark },
    TelescopePromptBorder = { fg = colors.gold, bg = colors.bg_dark },
    TelescopeResultsBorder = { fg = colors.gold, bg = colors.bg_dark },
    TelescopePreviewBorder = { fg = colors.gold, bg = colors.bg_dark },
    TelescopePromptPrefix = { fg = colors.gold },
    TelescopeSelectionCaret = { fg = colors.gold },
    TelescopeSelection = { fg = colors.bright_gold, bg = colors.visual },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.gold, bold = true },
    NvimTreeFolderName = { fg = colors.gold },
    NvimTreeFolderIcon = { fg = colors.gold },
    NvimTreeEmptyFolderName = { fg = colors.gray },
    NvimTreeOpenedFolderName = { fg = colors.bright_gold },
    NvimTreeIndentMarker = { fg = colors.gray },
    NvimTreeGitDirty = { fg = colors.amber },
    NvimTreeGitNew = { fg = colors.gold },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeSpecialFile = { fg = colors.bright_gold, underline = true },
    NvimTreeExecFile = { fg = colors.gold, bold = true },
    NvimTreeImageFile = { fg = colors.purple },

    -- Bufferline
    BufferLineFill = { bg = colors.bg_dark },
    BufferLineBackground = { fg = colors.gray, bg = colors.bg_light },
    BufferLineBufferVisible = { fg = colors.gray, bg = colors.bg_dark },
    BufferLineBufferSelected = { fg = colors.fg, bg = colors.bg, bold = true },
    BufferLineTab = { fg = colors.gray, bg = colors.bg_light },
    BufferLineTabSelected = { fg = colors.gold, bg = colors.bg },
    BufferLineTabClose = { fg = colors.red, bg = colors.bg_dark },
    BufferLineIndicatorSelected = { fg = colors.gold, bg = colors.bg },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.gold },
  }

  -- Apply highlights
  for group, styles in pairs(groups) do
    vim.api.nvim_set_hl(0, group, styles)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.amber
  vim.g.terminal_color_3 = colors.gold
  vim.g.terminal_color_4 = colors.brown
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.orange
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_gold
  vim.g.terminal_color_11 = colors.bright_gold
  vim.g.terminal_color_12 = colors.gold
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.amber
  vim.g.terminal_color_15 = colors.white
end

return M
