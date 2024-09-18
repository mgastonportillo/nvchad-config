---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local map = vim.keymap.set
    local pickers = require("gale.telescope").pickers
    local SIZES = {
      HEIGHT = 0.75,
      WIDTH = 0.66,
      PREVIEW_WIDTH = 0.5,
    }

    map("n", "<leader>fa", function()
      pickers.files("find", {
        layout_config = {
          horizontal = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
          },
        },
        follow = true,
        no_ignore = true,
        hidden = true,
        prompt_prefix = " 󱡴  ",
        prompt_title = "All Files",
      })
    end, { desc = "Telescope search all files" })

    map("n", "<leader>ff", function()
      pickers.files("find", {
        layout_config = {
          horizontal = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
          },
        },
        prompt_title = "Files",
      })
    end, { desc = "Telescope search files" })

    map("n", "<leader>fo", function()
      pickers.files("old", {
        layout_config = {
          horizontal = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
          },
        },
        prompt_title = "Old Files",
      })
    end, { desc = "Telescope search recent files" })

    map("n", "<leader>fw", function()
      pickers.grep("live_grep", nil, nil, {
        layout_config = {
          vertical = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
          },
        },
        prompt_title = "Live Grep",
      })
    end, { desc = "Telescope live grep" })

    map("n", "<leader>fb", function()
      pickers.buffers(true, {
        layout_config = {
          horizontal = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
          },
        },
      })
    end, { desc = "Telescope buffers" })

    map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current file" })
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

    opts = vim.tbl_deep_extend("force", opts, {
      defaults = {
        preview = {
          hide_on_startup = true,
        },
        results_title = false,
        selection_caret = " ",
        entry_prefix = " ",
        layout_config = {
          horizontal = {
            width = SIZES.WIDTH,
            height = SIZES.HEIGHT,
            preview_width = SIZES.PREVIEW_WIDTH,
          },
        },
        file_ignore_patterns = { "node_modules" },
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
            ["<F1>"] = require("telescope.actions.layout").toggle_preview,
          },
          n = {
            ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
            ["<F1>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
      pickers = {
        builtin = {
          prompt_title = "Builtin Pickers",
        },
      },
    })

    return opts
  end,
}
