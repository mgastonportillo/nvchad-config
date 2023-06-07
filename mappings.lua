---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    [":"] = {
      "<cmd>FineCmdline<CR>",
      opts = { nowait = true, noremap = true },
    },
    [";"] = {
      "<cmd>FineCmdline<CR>",
      opts = { nowait = true, noremap = true },
    },
    ["<CR>"] = { "gf" },
  },

  v = {
    -- Prevent cursor from jumping back to where selection started when yanking
    ["y"] = { "ygv<esc>" },
  },

  i = {
    -- Ctrl + Backspace removes a whole word (just like other apps)
    ["C-BS"] = { "<Esc>cvb" },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>cu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Update crates",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>" },
    ["<leader>ds"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.rust_tools = {
  plugin = true,
  n = {
    ["<C-space>"] = { "<cmd>RustHoverActions<CR>" },
    ["<leader>a"] = { "<cmd>RustCodeAction<CR>", "Rust Code Action" },
  },
}

M.searchbox = {
  plugin = true,
  n = {
    ["<leader>s"] = {
      "<cmd>SearchBoxIncSearch<CR>",
      "Enter Searchbox",
      opts = { noremap = true },
    },
    ["<leader>r"] = {
      "<cmd>SearchBoxReplace<CR>",
      "Enter Replace Searchbox",
      opts = { noremap = true },
    },
  },
}

M.swenv = {
  plugin = true,
  n = {
    ["<leader>ce"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "Choose env" },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle Trouble panel on/off",
    },
  },
}

return M
