local nvtree = require "nvim-tree"
local api = require "nvim-tree.api"

-- Add custom mappings
local function custom_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "+", api.tree.change_root_to_node, opts "CD")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "<ESC>", api.tree.close, opts "Close")
end

-- Automatically open file upon creation
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

dofile(vim.g.base46_cache .. "nvimtree")
nvtree.setup {
  on_attach = custom_on_attach,
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
  view = {
    -- Allow statuscolumn to be applied on nvim-tree
    signcolumn = "no",
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
}
