return {
  "sindrets/diffview.nvim",
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>", "<cmd><CR>")
  end,
  config = true,
}
