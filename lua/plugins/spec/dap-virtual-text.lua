return {
  "theHamsta/nvim-dap-virtual-text",
  event = "LspAttach",
  config = function(_, opts)
    require("nvim-dap-virtual-text").setup()
  end,
}
