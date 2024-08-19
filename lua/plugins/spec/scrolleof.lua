---@type NvPluginSpec
return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  opts = {},
  config = function()
    require("scrollEOF").setup()
  end,
}
