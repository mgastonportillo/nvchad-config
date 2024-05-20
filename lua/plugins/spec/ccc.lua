return {
  "uga-rosa/ccc.nvim",
  event = "BufEnter",
  config = function()
    local map = vim.keymap.set

    require("ccc").setup {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    }

    map("n", "cc", "<cmd>CccConvert<CR>", { desc = "Change Color space" })
    map("n", "ch", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle Color highlighter" })
    map("n", "<Leader>cp", "<cmd>CccPick<CR>", { desc = "Open Color picker" })
  end,
}
