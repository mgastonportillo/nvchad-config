return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require "harpoon"
    local extensions = require "harpoon.extensions"
    harpoon:setup()
    harpoon:extend(extensions.builtins.navigate_with_number())

    --[[ local config = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = config.file_previewer {},
          sorter = config.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set("n", "<C-p>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" }) ]]
  end,
}
