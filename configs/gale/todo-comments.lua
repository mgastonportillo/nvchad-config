local spec = {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup {
      keywords = {
        RACK = { icon = " ", color = "hint" },
      },
    }
  end,
}

return spec
