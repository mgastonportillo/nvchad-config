---@type NvPluginSpec
return {
  "mistricky/codesnap.nvim",
  event = "LspAttach",
  init = function()
    local map = vim.keymap.set
    map("x", "<leader>cc", "<cmd>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
    map("x", "<leader>cs", "<cmd>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures" })
  end,
  opts = {
    save_path = "~/Pictures",
    code_font_family = "JetBrainsMono Nerd Font",
    has_breadcrumbs = true,
    bg_theme = "grape",
    watermark = "",
  },
  build = "make",
}
