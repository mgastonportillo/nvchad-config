---@diagnostic disable: missing-fields
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
local modules = require("gale.chadconf").modules

---@type ChadrcConfig
return {
  base46 = {
    transparency = true,
    theme = "bearded-arc", ---@diagnostic disable-line
    theme_toggle = { "bearded-arc", "bearded-arc" }, ---@diagnostic disable-line

    changed_themes = {
      ["bearded-arc"] = {
        polish_hl = {
          defaults = {
            CursorLineNr = { fg = "#F6D96D", bold = true },
            FloatBorder = { link = "Comment" },
            LspInfoBorder = { link = "Comment" },
          },
          neogit = {
            NeogitDiffContextCursor = { link = "BoldCursorLine" },
          },
          nvimtree = {
            NvimTreeCursorLine = { link = "BoldCursorLine" },
          },
          tbline = {
            TbBufOn = { link = "Normal" },
          },
          telescope = {
            TelescopeBorder = { link = "Comment" },
            TelescopePromptBorder = { link = "Comment" },
            TelescopeSelection = { link = "BoldCursorLine" },
          },
          treesitter = {
            Comment = { fg = "#7589BF", italic = true },
            ["@comment"] = { fg = "#7589BF", italic = true },
          },
        },
      },
    },

    hl_override = {
      MatchWord = { fg = "NONE", bg = "black2" },
      MatchBackground = { link = "MatchWord" },
      LspInlayHint = { fg = "#7589bf", bg = "NONE" },
      FloatTitle = { link = "Title" },
      TbBufOffModified = { fg = { "green", "black", 50 } }, ---@diagnostic disable-line
      NeogitDiffContextHighlight = { bg = "NONE" },
      NeogitDiffContext = { bg = "NONE" },
      NvimTreeRootFolder = { fg = "vibrant_green" },
      NvimTreeGitDirty = { link = "NvimTreeNormal" },
      ["@keyword"] = { italic = true },
      --- use with eldritch
      -- CmpDocBorder = { fg = "purple" },
      -- NeogitDiffContextCursor = { bg = "light_grey" },
      -- TelescopeBorder = { fg = "purple" },
      -- TelescopePromptBorder = { fg = "purple" },
    },

    hl_add = {
      BoldCursorLine = { bg = { "line", -12 }, bold = true },
      YankVisual = { bg = "lightbg" },
      St_HarpoonInactive = { link = "StText" },
      St_HarpoonActive = { link = "St_LspHints" },
      CodeActionSignHl = { fg = "#f9e2af" },
      NvimTreeGitStagedIcon = { fg = "vibrant_green" },
      MarkviewLayer2 = { bg = "#171b21" },
      MarkviewCode = { link = "MarkviewLayer2" },
      HelpviewCode = { link = "MarkviewLayer2" },
      HelpviewInlineCode = { link = "MarkviewInlineCode" },
      HelpviewCodeLanguage = { link = "MarkviewCode" },
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
        "modified",
        "tint",
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
        modified = modules.statusline.modified,
        separator = modules.statusline.separator,
        tint = modules.statusline.tint,
      },
    },

    tabufline = {
      order = { "buffers", "tabs", "btns" },
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
