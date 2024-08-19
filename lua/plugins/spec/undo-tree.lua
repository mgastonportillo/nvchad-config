---@type NvPluginSpec
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  init = function()
    vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "UndoTree toggler" })
  end,
}
