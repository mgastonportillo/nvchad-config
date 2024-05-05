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
  end,
}
