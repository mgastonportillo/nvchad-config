---@type NvPluginSpec
return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = "VeryLazy",
  config = function()
    dofile(vim.g.base46_cache .. "todo")
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
