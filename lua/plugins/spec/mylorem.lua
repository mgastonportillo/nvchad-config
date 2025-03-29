return {
  "elvxk/mylorem.nvim",
  lazy = false,
  config = function()
    require("mylorem").setup {
      luasnip = true,
      ultisnips = false,
      vsnip = false,
      default = true,
    }
  end,
}
