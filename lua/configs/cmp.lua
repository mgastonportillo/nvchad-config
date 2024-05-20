local config = require("cmp.config").get()
local sources = table.insert(config.sources, { name = "crates" })

return {
  mapping = {
    ["<Tab>"] = vim.NIL,
    ["<S-Tab>"] = vim.NIL,
  },
  sources = sources,
}
