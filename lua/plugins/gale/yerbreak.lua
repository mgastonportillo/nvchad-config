return {
  -- "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  "mgastonportillo/yerbreak.nvim",
  dependencies = { "rcarriga/nvim-notify" },
  event = "VeryLazy",
  opts = {
    ascii_table = "mate",
    -- delay = 200,
    border = "none",
  },
  config = function(_, opts)
    require("yerbreak").setup(opts)
  end,
}
