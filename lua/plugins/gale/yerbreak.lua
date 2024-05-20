return {
  "mgastonportillo/yerbreak.nvim",
  dir = "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  dev = true,
  dependencies = { "rcarriga/nvim-notify" },
  event = "VeryLazy",
  opts = {
    ascii_table = "mate",
    -- delay = 200,
    border = "rounded",
  },
  config = function(_, opts)
    require("yerbreak").setup(opts)
    vim.keymap.set({ "n" }, "<leader>yb", "<cmd>Yerbreak<CR>", { desc = "Toggle Yerbreak" })
  end,
}
