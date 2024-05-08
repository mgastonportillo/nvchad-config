return {
  "utilyre/barbecue.nvim",
  lazy = false,
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
