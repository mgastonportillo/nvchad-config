return {
  "mgastonportillo/popurri.nvim",
  dir = vim.fn.expand "$HOME/workspace/neovim/popurri.nvim",
  dev = true,
  cmd = "Popurri",
  init = function()
    vim.keymap.set("n", "<leader>pp", "<cmd>Popurri<CR>", { desc = "Toggle Popurri" })
  end,
  opts = {
    default_query = "args",
  },
}
