---@type NvPluginSpec
return {
  "mgastonportillo/popurri.nvim",
  enabled = false, -- needs a couple fixes
  dev = true,
  cmd = "Popurri",
  init = function()
    vim.keymap.set("n", "<leader>pp", "<cmd>Popurri<CR>", { desc = "Toggle Popurri" })
  end,
  opts = {
    default_query = "args",
  },
}
