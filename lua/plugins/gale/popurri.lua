return {
  "mgastonportillo/popurri.nvim",
  dir = "/home/gale/workspace/my-projects/neovim/popurri.nvim",
  dev = true,
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>pp", "<cmd>Popurri<CR>", { desc = "Toggle Popurri" })
  end,
  opts = {
    default_query = "args",
  },
}
