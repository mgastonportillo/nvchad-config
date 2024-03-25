require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" }) -- enter cmd mode with ";"
map("i", "jk", "<ESC>") -- exit insert mode with "jk"
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- save using Ctrl+s
-- map("n", "gf", "<CR>") -- go to file with "gf"
map("n", "<C-z>", "<nop>") -- prevent force-closing with Ctrl+z
map("n", "<C-S-z>", "<nop>") -- prevent force-closing with Ctrl+Z
map("i", "C-BS", "<Esc>cvb") -- remove a whole word with Ctrl+Backspace
map("v", "y", "ygv<Esc>") -- prevent cursor jumping back to where selection started on yank

-- ccc
map("n", "<C-S-c>", "<cmd>CccConvert<CR>", { desc = "Change color space" })
map("n", "<leader>cv", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle Color Highlighter" })
map("n", "<Leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
-- comment
map("v", "<leader>_", function()
  require("Comment.api").toggle.blockwise.current()
end, { desc = "Block comment Toggle" })
-- crates
map("n", "<leader>cu", function()
  local crates = require "crates"
  crates.upgrade_all_crates()
end, { desc = "Update crates" })
-- dap
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>ds", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })
--dap-python
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)
-- finecmdline
-- map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })
-- mdpreview
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
-- rust-tools
map("n", "<C-space>", "<cmd>RustHoverActions<CR>")
map("n", "<leader>a", "<cmd>RustCodeAction<CR>", { desc = "Rust Code Action" })
-- searchbox
map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", { desc = "Enter Searchbox" })
map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", { desc = "Enter Replace Searchbox" })
-- swenv
local api = require "swenv.api"
map("n", "<leader>ps", function()
  api.pick_venv()
end, { desc = "Choose Python venv" })
map("n", "<leader>pe", function()
  api.get_current_venv()
end, { desc = "Show current Python venv" })
-- trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble panel on/off" })
--
