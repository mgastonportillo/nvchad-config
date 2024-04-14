require "nvchad.mappings"

local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- GROUP: [[ Core mappings ]]

-- Enter cmd mode with ";"
map("n", ";", ":", { desc = "CMD enter command mode" })
-- Exit insert mode with "jk"
map("i", "jk", "<ESC>")
-- Save using Ctrl+s
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Prevent force-closing with Ctrl+z / Ctrl+Z
map("n", "<C-z>", "<nop>")
map("n", "<C-S-z>", "<nop>")
-- Remove a whole word with Ctrl+Backspace
map("i", "<C-BS>", "<Esc>cvb")
-- Prevent cursor jumping back to where selection started on yank
map("v", "y", "ygv<Esc>")
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- GROUP: [[ Plugins mappings ]]

-- ccc
map("n", "<C-x>", "<cmd> CccConvert <CR>", { desc = "Change color space" })
map("n", "<leader>cv", "<cmd> CccHighlighterToggle <CR>", { desc = "Toggle Color Highlighter" })
map("n", "<Leader>cp", "<cmd> CccPick <CR>", { desc = "Color Picker" })

-- comment
-- Bind a single key that selects between single and multiline comment styles based on the current context
function _G.__toggle_contextual(vmode)
  local cfg = require("Comment.config"):get()
  local U = require "Comment.utils"
  local Op = require "Comment.opfunc"
  local range = U.get_region(vmode)
  local same_line = range.srow == range.erow

  local ctx = {
    cmode = U.cmode.toggle,
    range = range,
    cmotion = U.cmotion[vmode] or U.cmotion.line,
    ctype = same_line and U.ctype.linewise or U.ctype.blockwise,
  }

  local lcs, rcs = U.parse_cstr(cfg, ctx)
  local lines = U.get_lines(range)

  local params = {
    range = range,
    lines = lines,
    cfg = cfg,
    cmode = ctx.cmode,
    lcs = lcs,
    rcs = rcs,
    cfg,
  }

  if same_line then
    Op.linewise(params)
  else
    Op.blockwise(params)
  end
end
-- "n" is pre-mapped
map("x", "<leader>/", "<cmd> set operatorfunc=v:lua.__toggle_contextual <CR> g@")
-- Single line comment block, ideal for GROUP keywords
map("n", "<leader>_", function()
  require("Comment.api").toggle.blockwise.current()
end)

-- crates
map("n", "<leader>cu", function()
  local crates = require "crates"
  crates.upgrade_all_crates()
end, { desc = "Update crates" })

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader>ds", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- dap-python
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)

-- finecmdline
-- map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })

-- mdpreview
map("n", "<leader>mp", "<cmd> MarkdownPreviewToggle <CR>", { desc = "Toggle Markdown Preview" })

-- rustaceanvim
--[[ local bufnr = vim.api.nvim_get_current_buf()

map("n", "<C-space>", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })
map("n", "<leader>a", function()
	-- vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	vim.lsp.buf.codeAction() -- if you don't want grouping.
end, { desc = "Code Action", silent = true, buffer = bufnr }) ]]

-- searchbox
map("n", "<leader>s", "<cmd> SearchBoxIncSearch <CR>", { desc = "Enter Searchbox" })
map("n", "<leader>r", "<cmd> SearchBoxReplace <CR>", { desc = "Enter Replace Searchbox" })

-- swenv
-- local api = require("swenv.api")
-- map("n", "<leader>ps", function()
-- 	api.pick_venv()
-- end, { desc = "Choose Python venv" })
-- map("n", "<leader>pe", function()
-- 	api.get_current_venv()
-- end, { desc = "Show current Python venv" })

-- trouble
map("n", "<leader>tt", "<cmd> TroubleToggle <CR>", { desc = "Toggle Trouble panel on/off" })
