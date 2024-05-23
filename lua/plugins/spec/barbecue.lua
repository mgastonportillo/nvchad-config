return {
  enabled = false,
  "utilyre/barbecue.nvim",
  event = "VeryLazy",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    theme = {
      dirname = { fg = "#c3cfd9" },
      basename = { bold = true },
      context = { fg = "#c3cfd9" },
    },
  },
}
