---@type NvPluginSpec
return {
  "L3MON4D3/LuaSnip",
  config = function()
    require "nvchad.configs.luasnip"

    local map = vim.keymap.set
    local ls = require "luasnip"

    ls.filetype_extend("javascriptreact", { "html" })
    ls.filetype_extend("typescriptreact", { "html" })

    require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets/vscode" } }

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
