return {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
  init = function()
    local map = vim.keymap.set
    map("n", "cc", "<cmd>CccConvert<CR>", { desc = "Change Color space" })
    map("n", "ch", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle Color highlighter" })
    map("n", "cp", "<cmd>CccPick<CR>", { desc = "Open Color picker" })
  end,
  config = function()
    require("ccc").setup {
      highlighter = {
        auto_enable = false,
        lsp = true,
      },
    }
  end,
}
