-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/nvchad_types/chadrc.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "bearded-arc" },

  statusline = {
    theme = "vscode_colored",
  },

  telescope = { style = "bordered" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = { bg = "#202025" },
    FloatBorder = { fg = "#444c5b" },
  },

  hl_add = {
    YankVisual = { bg = "#303847" },
  },

  term = {
    float = {
      border = "rounded",
    },
  },

  tabufline = {
    enabled = false,
  },

  lsp = {
    signature = false,
    semantic_tokens = true,
  },
}

return M
