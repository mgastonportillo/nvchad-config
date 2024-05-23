local comment = require "Comment"
local ts_addon = require "ts_context_commentstring.integrations.comment_nvim"

comment.setup { pre_hook = ts_addon.create_pre_hook() }

-- Improve Astro commenting and add support for Sass
local ft = require "Comment.ft"
ft.set("scss", { "//%s", "/*%s*/" })
ft.set("astro", { "<!--%s-->", "<!--%s-->" })
