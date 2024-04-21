return {
  "folke/neodev.nvim",
  config = function()
    require("neodev").setup {
      library = {
        plugins = {
          "nvim-treesitter",
          "plenary.nvim",
          "telescope.nvim",
          "nvim-dap-ui",
        },
      },
    }
  end,
}
