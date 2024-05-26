return {
  "L3MON4D3/LuaSnip",
  config = function()
    require "nvchad.configs.luasnip"

    local map = require("gale.utils").glb_map
    local ls = require "luasnip"

    map({ "s", "i" }, "<C-y>", function()
      ls.expand()
    end, { desc = "Luasnip confirm snippet" })

    map({ "s", "i" }, "<C-j>", function()
      ls.jump(-1)
    end, { desc = "Luasnip jump backward" })

    map({ "s", "i" }, "<C-k>", function()
      ls.jump(1)
    end, { desc = "Luasnip jump forward" })

    vim.keymap.set({ "i", "s" }, "<C-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { desc = "Luasnip change active choice" })
  end,
}
