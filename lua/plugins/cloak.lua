return {
  "laytan/cloak.nvim",
  lazy = false,
  config = function()
    require("cloak").setup {
      enabled = true,
      cloak_character = "*",
      -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
      highlight_group = "Comment",
      cloak_length = 12,
      try_all_patterns = true,
      cloak_telescope = true,
      cloak_on_leave = false,
      patterns = {
        {
          file_pattern = ".env*",
          -- Match an equals sign and any character after it.
          -- This can also be a table of patterns to cloak,
          -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
          cloak_pattern = "=.+",
          -- A function, table or string to generate the replacement.
          -- The actual replacement will contain the 'cloak_character'
          -- where it doesn't cover the original text.
          -- If left empty the legacy behavior of keeping the first character is retained.
          replace = nil,
        },
      },
    }
  end,
}
