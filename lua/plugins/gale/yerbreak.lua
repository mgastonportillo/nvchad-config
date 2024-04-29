return {
  "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  -- "mgastonportillo/yerbreak.nvim",
  dependencies = { "levouh/tint.nvim", "rcarriga/nvim-notify" },
  event = "VeryLazy",
  opts = {
    border = "none",
  },
  config = function(_, opts)
    require("yerbreak").setup(opts)
  end,
}
