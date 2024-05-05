return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = { "rust" },
  config = function()
    local map = require("gale.utils").glb_map
    local bufnr = vim.api.nvim_get_current_buf()

    map("n", "K", function()
      vim.cmd.RustLsp { "hover", "actions" }
    end, { silent = true, buffer = bufnr, desc = "Rust Hover" })
    map("n", "<leader>a", function()
      vim.cmd.RustLsp "codeAction"
    end, { silent = true, buffer = bufnr, desc = "Rust Code actions" })
  end,
}
