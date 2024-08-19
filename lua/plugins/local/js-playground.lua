---@type NvPluginSpec
return {
  "mgastonportillo/js-playground.nvim",
  dev = true,
  dependencies = { "rcarriga/nvim-notify" },
  cmd = "JSPlayground",
  init = function()
    vim.keymap.set("n", "<leader>jp", "<cmd>JSPlayground<CR>", { desc = "Run JSPlayground" })
    vim.keymap.set("n", "<leader>jx", "<cmd>JSPlayground stop<CR>", { desc = "Stop JSPlayground" })
  end,
  config = true,
}
