return {
  "magicalne/nvim.ai",
  enabled = false,
  event = "BufEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    provider = "ollama",
    ollama = {
      model = "llama3",
    },
    keymaps = {
      toggle = "´´",
      send = "<CR>",
      close = "q",
      clear = "<C-x>",
      previous_chat = "<leader>[",
      next_chat = "<leader>]",
      inline_assist = "<leader>i",
    },
    ui = {
      width = 74,
      side = "right",
      borderchars = { "", "", "", "", "", "", "", "│" },
      highlight = {
        border = "FloatBorder",
        background = "NormalFloat",
      },
      prompt_prefix = "❯ ",
    },
    appearance = {
      icons = {
        user = "",
        assistant = "",
        system = "󰍹",
        error = "",
      },
    },
  },
}
