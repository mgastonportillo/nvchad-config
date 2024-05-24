return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = false,
      },
    }

    local map = vim.keymap.set
    map("n", "<leader>oo", "<cmd>Lspsaga outline<CR>", { desc = "LSP Toggle outline" })
    map("n", "gl", "<cmd>Lspsaga finder<CR>", { desc = "LSP Find symbol definition" })
    map("n", "<leader>dp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP Peek at definition" })
    map("n", "<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "LSP Go to type definition" })
    map("n", "tt", "<cmd>Lspsaga show_cursor_diagnostics ++unfocus<CR>", { desc = "LSP Show cursor diagnostics" })
  end,
}
