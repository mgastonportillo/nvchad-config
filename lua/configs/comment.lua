local comment = require "Comment"
local api = require "Comment.api"
local ts_addon = require "ts_context_commentstring.integrations.comment_nvim"
local map = require("gale.utils").glb_map

comment.setup { pre_hook = ts_addon.create_pre_hook() }

map(
  "x",
  "<leader>/",
  "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR> g@",
  { desc = "Detect the context and toggle comment accordingly" }
)
map("n", "<leader>_", function()
  api.toggle.blockwise.current()
end, { desc = "Force single-line block-comment" })

-- Improve Astro commenting and add support for Sass
local ft = require "Comment.ft"
ft.set("scss", { "//%s", "/*%s*/" })
ft.set("astro", { "<!--%s-->", "<!--%s-->" })
