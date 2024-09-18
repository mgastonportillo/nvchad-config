---@type NvPluginSpec
return {
  "laytan/cloak.nvim",
  lazy = false,
  init = function()
    vim.keymap.set("n", "<leader><F10>", "<cmd>CloakToggle<CR>", { desc = "Toggle Cloak" })
  end,
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      enabled = true,
      cloak_character = "*",
      highlight_group = "LazyOperator",
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
    })

    return opts
  end,
}
