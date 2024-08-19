---@type NvPluginSpec
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load { plugins = { "markdown-preview.nvim" } }
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
  end,
}
