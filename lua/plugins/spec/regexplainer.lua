return {
  "bennypowers/nvim-regexplainer",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("regexplainer").setup()
  end,
}
