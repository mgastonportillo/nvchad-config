return {
  "theHamsta/nvim-dap-virtual-text",
  event = "VeryLazy",
  config = function(_, opts)
    require("nvim-dap-virtual-text").setup()
  end,
}
