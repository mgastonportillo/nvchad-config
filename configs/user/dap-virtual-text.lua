local spec = {
  "theHamsta/nvim-dap-virtual-text",
  lazy = false,
  config = function(_, opts)
    require("nvim-dap-virtual-text").setup()
  end,
}

return spec
