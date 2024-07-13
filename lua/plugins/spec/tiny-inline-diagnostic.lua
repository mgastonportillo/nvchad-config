return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  config = function()
    require("tiny-inline-diagnostic").setup()
  end,
}
