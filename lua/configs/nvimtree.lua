return {
  git = { enable = true },
  renderer = {
    highlight_git = true,
    icons = {
      glyphs = {
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
    },
  },
  -- Allow statuscolumn to be applied on nvim-tree
  view = { signcolumn = "no" },
}
