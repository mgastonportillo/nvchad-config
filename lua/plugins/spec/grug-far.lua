return {
  "MagicDuck/grug-far.nvim",
  event = "BufEnter",
  config = function()
    require("grug-far").setup {}
  end,
}
