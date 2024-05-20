return {
  "mbbill/undotree",
  event = "BufEnter",
  config = function()
    vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "UndoTree toggler" })
  end,
}
