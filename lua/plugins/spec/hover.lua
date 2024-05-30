return {
  "lewis6991/hover.nvim",
  enabled = false,
  event = "BufWinEnter",
  config = function()
    require("hover").setup {
      init = function()
        require "hover.providers.lsp"
      end,
      preview_opts = {
        border = "rounded",
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = true,
      title = true,
    }

    local map = vim.keymap.set
    map("n", "K", require("hover").hover, { desc = "hover.nvim" })
    map("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
  end,
}
