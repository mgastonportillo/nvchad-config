return {
  "olimorris/codecompanion.nvim",
  cmd = {
    "CodeCompanion",
    "CodeCompanionAdd",
    "CodeCompanionChat",
    "CodeCompanionToggle",
    "CodeCompanionActions",
    "CodeCompanionWithBuffers",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
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
