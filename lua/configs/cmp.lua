return {
  mapping = {
    ["<Tab>"] = require("cmp").mapping(function(fallback)
      fallback()
    end),
    ["<S-Tab>"] = require("cmp").mapping(function(fallback)
      fallback()
    end),
  },
}
