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
  opts = function(_, opts)
    local custom_entry_maker = function(layout_opts)
      local devicons = require "nvim-web-devicons"
      local entry_display = require "telescope.pickers.entry_display"

      layout_opts = layout_opts or {}
      local default_icons, _ = devicons.get_icon("file", "", { default = true })

      local displayer = entry_display.create {
        separator = " ",
        items = {
          { width = vim.fn.strwidth(default_icons) },
          { remaining = true },
          { remaining = true },
        },
      }

      local make_display = function(entry)
        return displayer {
          { entry.devicons, entry.devicons_highlight },
          { entry.file_name },
          { entry.greyed_out, "@comment" },
        }
      end

      return function(entry)
        local greyed_out

        if entry:find "/" == nil then
          greyed_out = vim.fn.fnamemodify(entry, ":p:h")
        else
          greyed_out = entry:gsub("/[^/]*$", "")
        end

        local file_name = vim.fn.fnamemodify(entry, ":p:t")
        local icons, highlight = devicons.get_icon(entry, string.match(entry, "%a+$"), { default = true })

        return {
          valid = true,
          value = entry,
          ordinal = entry,
          display = make_display,
          devicons = icons,
          devicons_highlight = highlight,
          file_name = file_name,
          greyed_out = greyed_out,
        }
      end
    end

    opts = vim.tbl_deep_extend("force", opts, {
      defaults = {
        preview = {
          hide_on_startup = true,
        },
        results_title = false,
        selection_caret = " ",
        entry_prefix = " ",
        file_ignore_patterns = { "node_modules" },
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
          },
          n = {
            ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
      pickers = {
        oldfiles = {
          prompt_title = "Recent Files",
          entry_maker = custom_entry_maker(),
        },
        find_files = {
          prompt_title = "Files",
          entry_maker = custom_entry_maker(),
        },
        live_grep = {
          entry_maker = custom_entry_maker(),
        },
        builtin = {
          prompt_title = "Builtin Pickers",
        },
      },
    })

    return opts
  end,
}
