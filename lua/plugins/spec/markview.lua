return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local markview = require "markview"
    local defaults = markview.configuration

    local custom_callouts = {
      {
        match_string = "BRIEF",
        aliases = nil,
        callout_preview = "󰦩 Brief",
        callout_preview_hl = "MarkviewCol3Fg",
        custom_title = true,
        custom_icon = "󰦩 ",
        border = "▋",
        border_hl = "MarkviewCol3Fg",
      },
    }

    for _, callout in ipairs(custom_callouts) do
      table.insert(defaults.block_quotes.callouts, callout)
    end

    markview.setup(defaults)
  end,
}
