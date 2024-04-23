return {
  "uga-rosa/ccc.nvim",
  event = "VeryLazy",
  config = function()
    require("ccc").setup {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    }
  end,
}
