return {
  "smoka7/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
  opts = { keys = "etovxqpdygfblzhckisuran" },
  init = function()
    local map = vim.keymap.set
    map("n", "<leader><leader>w", "<cmd>HopWord<CR>", { desc = "Hint all words" })
    map("n", "<leader><leader>t", "<cmd>HopNodes<CR>", { desc = "Hint Tree" })
    map("n", "<leader><leader>c", "<cmd>HopLineStart<CR>", { desc = "Hint Columns" })
    map("n", "<leader><leader>l", "<cmd>HopWordCurrentLine<CR>", { desc = "Hint Line" })
  end,
}
