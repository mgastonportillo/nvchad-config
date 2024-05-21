return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
  end,
  opts = {
    preview_config = {
      border = "rounded",
    },
  },
}
