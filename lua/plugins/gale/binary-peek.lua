return {
  "mgastonportillo/binary-peek.nvim",
  dir = "/home/gale/workspace/my-projects/neovim/binary-peek.nvim",
  dev = true,
  name = "binary-peek",
  event = "VeryLazy",
  init = function()
    local map = require("gale.utils").glb_map
    map("n", "<leader>bs", "<cmd>BinaryPeek<CR>", { desc = "BinaryPeek start" })
    map("n", "<leader>bx", "<cmd>BinaryPeek abort<CR>", { desc = "BinaryPeek abort" })
  end,
  config = true,
}
