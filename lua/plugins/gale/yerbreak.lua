return {
  "mgastonportillo/yerbreak.nvim",
  dir = "/home/gale/workspace/my-projects/neovim/yerbreak.nvim",
  dev = true,
  dependencies = { "rcarriga/nvim-notify" },
  event = "VeryLazy",
  init = function()
    vim.keymap.set({ "n" }, "<leader>yb", "<cmd>Yerbreak<CR>", { desc = "Toggle Yerbreak" })
  end,
  opts = {
    ascii_table = "mate",
    delay = 200,
    border = "single",
  },
}
