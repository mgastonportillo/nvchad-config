return {
  "olimorris/codecompanion.nvim",
  cmd = "CodeCompanionToggle",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "´´", "<cmd>CodeCompanionToggle<CR>", { desc = "Toggle CodeCompanion" })
  end,
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
