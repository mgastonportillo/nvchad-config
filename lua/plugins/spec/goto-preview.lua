---@type NvPluginSpec
return {
  "rmagatti/goto-preview",
  event = "LspAttach",
  init = function()
    local gtp = require "goto-preview"

    vim.keymap.set("n", "<leader>q", function()
      gtp.dismiss_preview(0)
    end, { desc = "Close current definition preview" })
  end,
  config = function()
    require("goto-preview").setup {
      default_mappings = true,
    }
  end,
}
