return {
  "numToStr/Comment.nvim",
  init = function()
    local map = require("gale.utils").glb_map
    local api = require "Comment.api"

    map(
      { "x", "n" },
      "<leader>/",
      "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR> g@",
      { desc = "Toggle comment (aware of context)" }
    )

    map("n", "<leader>_", function()
      api.toggle.blockwise.current()
    end, { desc = "Toggle comment block in single line" })
  end,
  config = function()
    require "configs.comment"
  end,
}
