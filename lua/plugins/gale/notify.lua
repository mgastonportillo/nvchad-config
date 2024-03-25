return {
  "rcarriga/nvim-notify",
  event = "BufWinEnter",
  config = function()
    vim.notify = require "notify"
    vim.notify.setup {
      background_colour = "#3a4251",
      top_down = false,
    }
  end,
}

