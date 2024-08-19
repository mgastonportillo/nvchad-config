---@type NvPluginSpec
return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    right = {
      { ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.45 } },
      { ft = "jsplayground", title = "JS Playground", size = { width = 0.45 } },
    },
  },
}
