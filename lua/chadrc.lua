---@diagnostic disable: missing-fields
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
local modules = require("gale.chadconf").modules

---@type ChadrcConfig
return {
  base46 = {
    transparency = true,
    theme = "bearded-arc",
    theme_toggle = { "bearded-arc", "chadracula-evondev" },

    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
      CursorLineNr = { fg = "yellow", bold = true },
      LspInlayHint = { fg = "#4e5665", bg = "NONE" },
      FloatTitle = { link = "Title" },
      FloatBorder = { link = "TelescopeBorder" },
      TelescopeSelection = { bg = { "black", -2 }, bold = true },
      NvimTreeRootFolder = { link = "TelescopeBorder" },
      NvimTreeGitDirty = { link = "NvimTreeNormal" },
      ["@keyword"] = { italic = true },
      NvimTreeCursorLine = { bg = { "black", -2 } },
    },

    hl_add = {
      YankVisual = { link = "CursorColumn" },
      LspInfoBorder = { fg = "#444c5b" },
      WinBar = { bg = "NONE" },
      WinBarNC = { bg = "NONE" },
      DropBarMenuCurrentContext = { link = "Visual" },
      St_HarpoonInactive = { link = "StText" },
      St_HarpoonActive = { link = "St_LspHints" },
      NvimTreeGitStagedIcon = { fg = "#a6e3a1" },
      MarkviewLayer2 = { bg = "#171b21" },
      MarkviewCode = { link = "MarkviewLayer2" },
      HelpviewCode = { link = "MarkviewLayer2" },
      HelpviewInlineCode = { link = "MarkviewInlineCode" },
      HelpviewCodeLanguage = { link = "MarkviewCode" },
      CodeActionSignHl = { fg = "#f9e2af" },
      ["@markup.quote.markdown"] = { bg = "NONE" },
      ["@markup.raw.block.markdown"] = { link = "MarkviewLayer2" },
    },

    integrations = {
      "blankline",
      "cmp",
      "codeactionmenu",
      "dap",
      "devicons",
      "hop",
      "lsp",
      "mason",
      "neogit",
      "notify",
      "nvimtree",
      "rainbowdelimiters",
      "semantic_tokens",
      "todo",
      "whichkey",
    },
  },

  ui = {
    statusline = {
      theme = "vscode_colored",
      order = {
        "mode",
        "tint",
        "separator",
        "file",
        "git",
        "%=",
        "lsp_msg",
        "%=",
        "diagnostics",
        "lsp",
        "harpoon",
        "separator",
        "cwd",
      },
      modules = {
        hack = modules.statusline.hack,
        harpoon = modules.statusline.harpoon,
        separator = modules.statusline.separator,
        tint = modules.statusline.tint,
      },
    },

    tabufline = {
      order = { "buffers", "tabs", "btns" },
    },

    cmp = {
      style = "default",
      icons = true,
      lspkind_text = true,
      icons_left = true,
      format_colors = {
        tailwind = true,
        icon = "󱓻",
      },
    },

    telescope = { style = "bordered" },
  },

  cheatsheet = {
    excluded_groups = { "_" },
  },

  lsp = {
    signature = true,
  },

  term = {
    float = {
      border = "rounded",
      height = 0.5,
      width = 0.58,
      col = 0.2,
      row = 0.2,
    },
  },
}
