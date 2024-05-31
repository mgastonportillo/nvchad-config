return {
  "lewis6991/gitsigns.nvim",
  dependencies = "sindrets/diffview.nvim",
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "Gitsigns blame line" })
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Gitsigns toggle deleted" })
  end,
  opts = {
    preview_config = {
      border = "rounded",
    },
  },
}
