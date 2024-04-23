return {
  git = { enable = true },
  renderer = {
    highlight_git = true,
    icons = {
      glyphs = {
        folder = {
          default = "¯ù┐",
          open = "¯ù¥",
          empty = "¯¬â",
          empty_open = "¯½À",
        },
      },
    },
  },
  -- Allow statuscolumn to be applied on nvim-tree
  view = { signcolumn = "no" },
}
