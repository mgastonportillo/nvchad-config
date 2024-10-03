return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    watch_for_changes = true,
    cleanup_delay_ms = 0,
    win_options = {
      winbar = "%!v:lua.get_oil_winbar()",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<Tab>"] = "actions.select",
      ["<C-s>"] = false,
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-l>"] = "actions.refresh",
      ["<C-c>"] = false,
      ["q"] = "actions.close",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
  config = function(_, opts)
    local toggle_oil = function()
      if not vim.g.oil_is_open then
        vim.g.oil_is_open = true
        require("oil").open()
      else
        vim.g.oil_is_open = false
        require("oil").close()
      end
    end

    local map = require("gale.utils").glb_map
    map("n", "<C-n>", function()
      toggle_oil()
    end, { desc = "Open Oil" })

    require("oil").setup(opts)
  end,
}
