return {
  "numToStr/Comment.nvim",
  init = function()
    local map = require("gale.utils").glb_map
    local api = require "Comment.api"

    map("n", "<leader>_", function()
      api.toggle.blockwise.current()
    end, { desc = "Comment toggle (block) in single line" })

    map("n", "<leader>/", function()
      api.toggle.linewise.current()
    end, { desc = "Comment toggle" })

    map(
      "x",
      "<leader>/",
      "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@",
      { desc = "Comment toggle (aware of context)" }
    )
  end,
  config = function()
    local comment = require "Comment"
    local ts_addon = require "ts_context_commentstring.integrations.comment_nvim"

    comment.setup { pre_hook = ts_addon.create_pre_hook() }

    -- Improve Astro commenting and add support for Sass
    local ft = require "Comment.ft"
    ft.set("scss", { "//%s", "/*%s*/" })
    ft.set("astro", { "<!--%s-->", "<!--%s-->" })
  end,
}
