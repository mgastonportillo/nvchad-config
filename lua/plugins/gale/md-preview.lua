return {
  "iamcco/markdown-preview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = "markdown",
  build = function()
    local install_path = vim.fn.stdpath "data" .. "/lazy/markdown-preview.nvim/app"
    vim.cmd("silent !cd " .. install_path .. " && yarn install && git restore .")
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- vim.g.mkdp_auto_close = 0
  end,
  -- config = function() end,
}
