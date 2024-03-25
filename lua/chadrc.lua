-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  statusline = { theme = "vscode_colored" },
  theme = "bearded-arc",
  theme_toggle = { "chadracula-evondev", "bearded-arc" },
  telescope = { style = "bordered" },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  -- hl_add = {}
  -- nvdash = {}
}

-- M.settings = {
--   cc_size = "130",
--   so_size = 10,
--   blacklist = {
--     "NvimTree",
--     "nvdash",
--     "nvcheatsheet",
--     "terminal",
--     "Trouble",
--     "help",
--   },
-- }

-- M.lazy_nvim = {}

return M
