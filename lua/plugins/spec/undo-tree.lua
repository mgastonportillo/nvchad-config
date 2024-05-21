return {
  "mbbill/undotree",
  event = "BufEnter",
  init = function()
    vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "UndoTree toggler" })
  end,
}
