---@type NvPluginSpec
return {
  -- TODO: re-enable once html support improves
  enabled = false,
  "HiPhish/rainbow-delimiters.nvim",
  event = "FileType",
  config = function()
    dofile(vim.g.base46_cache .. "rainbow-delimiters")
    require("rainbow-delimiters").setup()
  end,
}
