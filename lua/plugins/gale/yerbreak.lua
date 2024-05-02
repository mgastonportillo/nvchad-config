return {
  -- "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  "mgastonportillo/yerbreak.nvim",
  dependencies = { "rcarriga/nvim-notify" },
  event = "VeryLazy",
  opts = {
    -- ascii_table = "op",
    -- delay = 5000,
    border = "none",
  },
  config = function(_, opts)
    require("yerbreak").setup(opts)
  end,
}
