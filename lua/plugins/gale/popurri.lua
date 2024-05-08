return {
  enabled = false,
  dir = "/home/gale/workspace/my-projects/neovim/popurri.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("popurri").setup(opts)
  end,
}
