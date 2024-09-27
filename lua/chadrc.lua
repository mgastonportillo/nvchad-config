-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
---@type ChadrcConfig
local M = {}

local modules = require("gale.chadrc_aux").modules
local theme_customs = require("gale.chadrc_aux").theme_customs

M.base46 = {
  transparency = true,
  -- BUG: (types) theme should be able to accept user themes
  theme = "eldritch", ---@diagnostic disable-line
  -- BUG: (types) theme toggle can be expanded with user themes
  theme_toggle = { "eldritch", "eldritch" }, ---@diagnostic disable-line

  integrations = {
    "blankline",
    "cmp",
    "codeactionmenu",
    "dap",
    "devicons",
    "hop",
    "lsp",
    "mason",
    "neogit",
    "notify",
    "nvimtree",
    "rainbowdelimiters",
    "semantic_tokens",
    "todo",
    "whichkey",
  },
}

local themed_values = theme_customs[M.base46.theme]

M.base46.hl_override = {
  CursorLineNr = { fg = "yellow", bold = true },
  FloatBorder = { fg = themed_values.border_fg, bg = "NONE" },
  TelescopeBorder = { link = "FloatBorder" },
  TelescopePromptBorder = { link = "FloatBorder" },
  TelescopeSelection = { bg = themed_values.curline_bg, fg = "#DDDDDD", bold = true },
  NvimTreeCursorLine = { bg = themed_values.curline_bg, fg = themed_values.curline_fg, bold = true },
  MatchWord = { fg = "NONE", bg = "black2" },
  MatchBackground = { link = "MatchWord" },
  NeogitDiffContext = { bg = "NONE" },
  NeogitDiffContextCursor = { bg = themed_values.curline_colour, bold = true },
  NeogitDiffContextHighlight = { bg = "NONE" },
  NvimTreeRootFolder = { fg = "vibrant_green" },
  NvimTreeGitDirty = { link = "NvimTreeNormal" },
  TbBufOn = { link = themed_values.buf_on_link },
  StText = { fg = themed_values.st_text },
  St_NormalMode = { fg = themed_values.st_normal_fg, bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_InsertMode = { fg = themed_values.st_insert_fg, bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_cwd = { fg = themed_values.st_cwd_fg, bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_CommandMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_ConfirmMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_SelectMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_VisualMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_ReplaceMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_TerminalMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  St_NTerminalMode = { bg = themed_values.st_bg, reverse = themed_values.reverse },
  -- BUG: (types) fg can take a table as an argument
  TbBufOffModified = { fg = { "green", "black", 50 } }, ---@diagnostic disable-line
  FloatTitle = { fg = themed_values.border_fg, bg = "NONE" },
  LspInlayHint = { fg = themed_values.border_fg, bg = "NONE" },
  Comment = { fg = themed_values.comment_fg, italic = true },
  CmpBorder = { link = "FloatBorder" },
  CmpDocBorder = { link = "FloatBorder" },
  ["@comment"] = { link = "Comment" },
  ["@keyword"] = { italic = true },
}

M.base46.hl_add = {
  -- BUG: (types) fg can take a table as an argument
  BeardedCurline = { fg = { "black", -12 } }, ---@diagnostic disable-line
  LspInfoBorder = { link = "FloatBorder" },
  YankVisual = { bg = "lightbg" },
  St_HarpoonInactive = { link = "StText" },
  St_HarpoonActive = { link = "St_LspHints" },
  CodeActionSignHl = { fg = themed_values.code_action_fg },
  NvimTreeGitStagedIcon = { fg = "vibrant_green" },
  MarkviewLayer2 = { bg = "#171B21" },
  MarkviewCode = { link = "MarkviewLayer2" },
  HelpviewCode = { link = "MarkviewLayer2" },
  HelpviewInlineCode = { link = "MarkviewInlineCode" },
  HelpviewCodeLanguage = { link = "MarkviewCode" },
  ["@markup.quote.markdown"] = { bg = "NONE" },
  ["@markup.raw.block.markdown"] = { link = "MarkviewLayer2" },
  ["@number.luadoc"] = { fg = "Comment" },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    order = {
      "mode",
      "tint",
      "separator",
      "filename",
      "modified",
      "tint",
      "git_custom",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "harpoon",
      "separator",
      "cwd",
    },
    modules = {
      hack = modules.statusline.hack,
      filename = modules.statusline.filename,
      harpoon = modules.statusline.harpoon,
      git_custom = modules.statusline.git_custom,
      modified = modules.statusline.modified,
      separator = modules.statusline.separator,
      tint = modules.statusline.tint,
    },
  },

  tabufline = {
    order = { "buffers", "tabs", "btns" },
  },

  telescope = { style = "bordered" },
}

M.cheatsheet = {
  excluded_groups = { "_" },
}

M.lsp = {
  signature = true,
}

M.term = {
  -- BUG: (types) TermFloat values should be optional
  float = { ---@diagnostic disable-line
    border = "rounded",
    height = 0.5,
    width = 0.58,
    col = 0.2,
    row = 0.2,
  },
  -- BUG: (types) TermSizes values should be optional
  sizes = {}, ---@diagnostic disable-line
}

return M
