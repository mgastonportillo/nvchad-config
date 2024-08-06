---@diagnostic disable: different-requires
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "hrsh7th/cmp-cmdline" },
    { "brenoprata10/nvim-highlight-colors" },
  },
  opts = {
    mapping = {
      ["<Tab>"] = vim.NIL,
      ["<S-Tab>"] = vim.NIL,
    },
  },
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
        {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
      },
    })

    local cmp_ui = require("nvconfig").ui.cmp
    local cmp_style = cmp_ui.style

    local colors = require "nvim-highlight-colors.color.utils"
    local utils = require "nvim-highlight-colors.utils"

    local field_arrangement = {
      atom = { "kind", "abbr", "menu" },
      atom_colored = { "kind", "abbr", "menu" },
    }

    opts.formatting = {
      fields = field_arrangement[cmp_style] or { "abbr", "menu", "kind" },

      format = function(entry, item)
        local icons = require "nvchad.icons.lspkind"
        local icon = (cmp_ui.icons and icons[item.kind]) or ""

        if cmp_style == "atom" or cmp_style == "atom_colored" then
          icon = " " .. icon .. " "
          item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
          item.kind = icon
        else
          icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
          item.kind = string.format("%s %s ", icon, cmp_ui.lspkind_text and item.kind or "")
        end

        local entryItem = entry:get_completion_item()
        if entryItem == nil then
          return item
        end

        local entryDoc = entryItem.documentation
        if entryDoc == nil or type(entryDoc) ~= "string" then
          return item
        end

        local color_hex = colors.get_color_value(entryDoc)
        if color_hex == nil then
          return item
        end

        local highlight_group = utils.create_highlight_name("fg-" .. color_hex)
        vim.api.nvim_set_hl(0, highlight_group, { fg = color_hex, default = true })
        item.abbr_hl_group = highlight_group

        return item
      end,
    }

    cmp.setup(opts)
  end,
}
