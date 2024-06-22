return {
  "mgastonportillo/binary-peek.nvim",
  enabled = false,
  dir = vim.fn.expand "$HOME/workspace/neovim/binary-peek.nvim",
  dev = true,
  name = "binary-peek",
  event = "VeryLazy",
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>bs", "<cmd>BinaryPeek<CR>", { desc = "BinaryPeek start" })
    map("n", "<leader>bx", "<cmd>BinaryPeek abort<CR>", { desc = "BinaryPeek abort" })
  end,
  config = true,
}
