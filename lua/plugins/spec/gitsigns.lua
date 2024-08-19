---@type NvPluginSpec
return {
  "lewis6991/gitsigns.nvim",
  dependencies = "sindrets/diffview.nvim",
  ---@class Gitsigns.Config
  opts = {
    preview_config = {
      border = "rounded",
    },
    on_attach = function(bufnr)
      local gs = require "gitsigns"
      local map = require("gale.utils").buf_map

      map(bufnr, "n", "<leader>td", gs.toggle_deleted, { desc = "Gitsigns toggle deleted" })
      map(bufnr, "n", "<leader>hr", gs.reset_hunk, { desc = "Gitsigns reset hunk" })
      map(bufnr, "n", "<leader>hs", gs.stage_hunk, { desc = "Gitsigns stage hunk" })
      map(bufnr, "n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
      map(bufnr, "n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
      map(bufnr, "n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
      map(bufnr, "n", "<leader>hh", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
      map(bufnr, { "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })

      map(bufnr, "n", "<leader>hn", function()
        if vim.wo.diff then
          vim.cmd.normal { "<leader>hn", bang = true }
        else
          gs.nav_hunk "next"
        end
      end, { desc = "Gitsigns next hunk" })

      map(bufnr, "n", "<leader>hb", function()
        if vim.wo.diff then
          vim.cmd.normal { "<leader>hp", bang = true }
        else
          gs.nav_hunk "prev"
        end
      end, { desc = "Gitsigns previous hunk" })

      map(bufnr, "n", "<leader>bl", function()
        gs.blame_line { full = true }
      end, { desc = "Gitsigns blame line" })
    end,
  },
}
