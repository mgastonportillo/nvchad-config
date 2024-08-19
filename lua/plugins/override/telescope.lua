---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  init = function()
    local map = vim.keymap.set
    local builtin = require "telescope.builtin"

    map("n", "<leader>fa", function()
      builtin.find_files {
        follow = true,
        no_ignore = true,
        hidden = true,
        prompt_prefix = " 󱡴  ",
        prompt_title = "All Files",
      }
    end, { desc = "Telescope search all files" })
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope search files" })
    map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope search recent files" })
    map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current file" })
    map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope buffers" })
    map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "Telescope terms" })
    map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope NvChad themes" })
    map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP references" })
    map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
    map("n", "<leader>fh", "<cmd>Telescope highlights<CR>", { desc = "Telescope find highlights" })
    map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope LSP diagnostics" })
    map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "Telescope TreeSitter" })
    map("n", "<leader>fp", "<cmd>Telescope builtin<CR>", { desc = "Telescope pickers" })
    map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
    map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
    map("n", "<leader>f?", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help tags" })
  end,
  opts = {
    defaults = {
      selection_caret = " ",
      entry_prefix = " ",
      file_ignore_patterns = { "node_modules" },
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
    },
    pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        prompt_title = "Files",
      },
      builtin = {
        prompt_title = "Builtin Pickers",
      },
    },
  },
}
