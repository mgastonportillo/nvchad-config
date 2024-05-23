return {
  enabled = false,
  "AckslD/swenv.nvim",
  ft = "python",
  config = function()
    require("swenv").setup {
      post_set_env = function()
        vim.cmd "LspRestart"
      end,
    }

    local map = vim.keymap.set
    local api = require "swenv.api"

    map("n", "<leader>ps", function()
      api.pick_venv()
    end, { desc = "Choose Python venv" })
    map("n", "<leader>pe", function()
      api.get_current_venv()
    end, { desc = "Show current Python venv" })
  end,
}
