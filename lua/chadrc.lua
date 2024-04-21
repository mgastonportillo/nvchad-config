-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/nvchad_types/chadrc.lua

-- ---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = "bearded-arc",
  theme_toggle = { "chadracula-evondev", "bearded-arc" },

  statusline = {
    theme = "vscode_colored",
  },

  telescope = { style = "bordered" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    YankVisual = { bg = "#303847" },
  },

  nvdash = {
    load_on_startup = false,
    header = { "Hello from NVIM" },
  },

  term = {
    float = {
      border = "rounded",
    },
  },

  lsp = {
    signature = false,
    semantic_tokens = true,
  },
}

return M
