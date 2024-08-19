---@type NvPluginSpec
return {
  "bennypowers/nvim-regexplainer",
  event = "BufEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("regexplainer").setup()
  end,
}
