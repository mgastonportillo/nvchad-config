return {
  -- "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  "mgastonportillo/yerbreak.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("yerbreak").setup(opts)
  end,
}
