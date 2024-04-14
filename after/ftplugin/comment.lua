-- Improve Astro commenting and add support for Sass
require("Comment").setup()
local ft = require "Comment.ft"
ft.set("scss", { "//%s", "/*%s*/" })
ft.set("astro", { "<!--%s-->", "<!--%s-->" })
