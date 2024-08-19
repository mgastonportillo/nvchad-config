---@type NvPluginSpec
return {
  "mgastonportillo/yerbreak.nvim",
  dev = true,
  dependencies = { "rcarriga/nvim-notify" },
  cmd = "Yerbreak",
  init = function()
    vim.keymap.set("n", "<leader>yb", "<cmd>Yerbreak<CR>", { desc = "Toggle Yerbreak" })
  end,
  opts = {
    ascii_table = "mate",
    delay = 200,
    border = "single",
  },
}
