---@class Base46Table
---Credits to original port author: [BK](https://github.com/BrunoKrugel)

local M = {}
M.base_30 = {
  white = "#D9E0EE",
  darker_black = "#313346",
  black = "#313346", --  nvim bg
  black2 = "#3B3D54",
  one_bg = "#2D2C3C", -- real bg of onedark
  one_bg2 = "#38364A",
  one_bg3 = "#424057",
  grey = "#75799E",
  grey_fg = "#8386A8",
  grey_fg2 = "#7C80A3",
  light_grey = "#605F6F",
  red = "#F38BA8",
  baby_pink = "#FFA5C3",
  pink = "#F5C2E7",
  line = "#383747", -- for lines like vertsplit
  green = "#A6E3A1",
  vibrant_green = "#A5C989",
  nord_blue = "#8BC2F0",
  blue = "#89B4FA",
  yellow = "#F9E2AF",
  sun = "#FFE9B6",
  purple = "#CBA6F7",
  dark_purple = "#B697E1",
  teal = "#B5E8E0",
  orange = "#F8BD96",
  cyan = "#89DCEB",
  statusline_bg = "#313346",
  lightbg = "#2F2E3E",
  pmenu_bg = "#A6E3A1",
  folder_bg = "#74C7EC",
  lavender = "#B4BEFE",
}

M.base_16 = {
  base00 = "#313346",
  base01 = "#282737",
  base02 = "#2F2E3E",
  base03 = "#383747",
  base04 = "#414050",
  base05 = "#BFC6D4",
  base06 = "#CCD3E1",
  base07 = "#D9E0EE",
  base08 = "#F38BA8",
  base09 = "#F8BD96",
  base0A = "#FAE3B0",
  base0B = "#A5C989",
  base0C = "#89DCEB",
  base0D = "#89B4FA",
  base0E = "#CBA6F7",
  base0F = "#F38BA8",
}

M.polish_hl = {
  treesitter = {
    -- ["@type"] = { fg = M.base_30.purple },
    -- ["@variable"] = { fg = M.base_30.lavender },
    ["@variable.builtin"] = { fg = M.base_30.red },
    ["@function.builtin"] = { fg = M.base_30.cyan },
    ["Function"] = { fg = M.base_30.blue },
    ["@function"] = { fg = M.base_30.blue },
    ["@keyword"] = { fg = M.base_30.pink },
    ["@property"] = { fg = M.base_30.cyan },
    ["@type.builtin"] = { fg = M.base_30.purple },
    ["@variable"] = { fg = M.base_30.sun },
  },
}

M.type = "dark"

return M
