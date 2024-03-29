require("nvchad.mappings")

local map = vim.keymap.set

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
map("i", "C-BS", "<Esc>cvb", { expr = true, noremap = true })
-- Prevent cursor jumping back to where selection started on yank
map("v", "y", "ygv<Esc>")

-- GROUP: [[ Plugins mappings ]]

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
	local crates = require("crates")
	crates.upgrade_all_crates()
end, { desc = "Update crates" })

-- dap
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
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
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-- rustaceanvim
local bufnr = vim.api.nvim_get_current_buf()

map("n", "<C-space>", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })
map("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = "Code Action", silent = true, buffer = bufnr })

-- searchbox
map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", { desc = "Enter Searchbox" })
map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", { desc = "Enter Replace Searchbox" })

-- swenv
-- local api = require("swenv.api")
-- map("n", "<leader>ps", function()
-- 	api.pick_venv()
-- end, { desc = "Choose Python venv" })
-- map("n", "<leader>pe", function()
-- 	api.get_current_venv()
-- end, { desc = "Show current Python venv" })

-- trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble panel on/off" })
