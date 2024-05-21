return {
  "rcarriga/nvim-notify",
  event = "BufWinEnter",
  config = function()
    vim.notify = require "notify"
    ---@diagnostic disable-next-line
    vim.notify.setup {
      background_colour = "#1c2433",
      top_down = true,
    }
  end,
}
