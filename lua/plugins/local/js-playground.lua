return {
  "mgastonportillo/js-playground.nvim",
  dir = vim.fn.expand "$HOME/workspace/neovim/js-playground.nvim",
  dev = false,
  dependencies = { "rcarriga/nvim-notify" },
  cmd = "JSPlayground",
  init = function()
    vim.keymap.set("n", "<leader>jp", "<cmd>JSPlayground<CR>", { desc = "Run JSPlayground" })
    vim.keymap.set("n", "<leader>jx", "<cmd>JSPlayground stop<CR>", { desc = "Stop JSPlayground" })
  end,
  config = true,
}
