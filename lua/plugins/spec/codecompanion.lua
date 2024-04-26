return {
  "olimorris/codecompanion.nvim",
  event = "BufWinEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("codecompanion").setup {
      adapters = {
        ollama = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "llama3",
            },
          },
        }),
      },
      strategies = {
        chat = "ollama",
        inline = "ollama",
      },
    }
  end,
}
