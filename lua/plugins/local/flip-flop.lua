return {
  dir = vim.fn.expand "$HOME/workspace/neovim/flip-flop.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("flipflop").setup()
  end,
}
