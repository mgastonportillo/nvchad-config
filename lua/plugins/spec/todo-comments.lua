return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = "VeryLazy",
  config = function()
    require("todo-comments").setup {
      keywords = {
        GROUP = { icon = " ", color = "hint" },
        HERE = { icon = " ", color = "here" },
      },
      colors = { here = "#fdf5a4" },
      highlight = { multiline = true },
    }
  end,
}
