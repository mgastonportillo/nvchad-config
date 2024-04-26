require "nvchad.mappings"
local bufnr = vim.api.nvim_get_current_buf()

local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- GROUP: [[ CORE MAPPINGS ]]

-- Enter cmd mode with ";"
map("n", ";", ":", { desc = "Enter CMD mode" })
-- Exit insert mode with "jk"
map("i", "jk", "<ESC>")
-- Save using Ctrl+s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")
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
-- Move lines up/down
map("n", "<A-Down>", ":m .+1<CR>")
map("n", "<A-Up>", ":m .-2<CR>")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- GROUP: [[ PLUGIN MAPPINGS ]]

-- PLUGIN: ccc
map("n", "<C-x>", "<cmd>CccConvert<CR>", { desc = "Change Color Space" })
map("n", "<leader>cv", "<cmd>CccHighlighterToggle<CR>", {
  desc = "Toggle Color Highlighter",
})
map("n", "<Leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })

-- PLUGIN: comment
-- Bind a single key that selects between single and
-- multiline comment styles based on the current context
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
map("x", "<leader>/", "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR> g@")
-- Single line comment block, ideal for GROUP keywords
map("n", "<leader>_", function()
  require("Comment.api").toggle.blockwise.current()
end)

-- PLUGIN: crates
map("n", "<leader>cu", function()
  local crates = require "crates"
  crates.upgrade_all_crates()
end, { desc = "Update crates" })

-- PLUGIN: dap
local widgets = require "dap.ui.widgets"
local sidebar = widgets.sidebar(widgets.scopes)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>dt", function()
  sidebar.toggle()
end, { desc = "Toggle debugging sidebar" })

-- PLUGIN: dap-python
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)

-- PLUGIN: gen-nvim
map({ "n", "v" }, "<leader>*", "<cmd>Gen<CR>", { desc = "Open gen.nvim" })

-- PLUGIN: lsp-saga
map({ "n", "v" }, "cA", "<cmd>Lspsaga code_action<CR>", { desc = "LSP Code action" })
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Find symbol definition" })
map("n", "cr", "<cmd>Lspsaga rename<CR>", { desc = "LSP Rename in file" })
map("n", "cR", "<cmd>Lspsaga rename ++project<CR>", { desc = "LSP Rename in selected files" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP Peek at definition" })
map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", { desc = "LSP Go to definition" })
map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "LSP Go to type definition" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "LSP Prev diagnostics" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "LSP Next diagnostics" })
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "LSP Toggle outline" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover" })
map("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = "LSP Prev error" })
map("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = "LSP Next error" })

-- PLUGIN: md-preview
map("n", "<leader>mp", "<cmd> MarkdownPreviewToggle <CR>", {
  desc = "Toggle Markdown Preview",
})

-- PLUGIN: popurri
map("n", "<leader>pp", "<cmd>Popurri<CR>", { desc = "Toggle Popurri" })

-- PLUGIN: rustaceanvim
map("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr, desc = "Rust Hover" })
map("n", "<leader>a", function()
  -- vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  vim.lsp.buf.codeAction() -- if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "Rust Code actions" })

-- PLUGIN: searchbox
map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", {
  desc = "Enter Searchbox",
})
map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", {
  desc = "Enter Replace Searchbox",
})

-- PLUGIN: telescope
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope Find references" })
map("n", "<leader>f?", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Find help tags" })
map("n", "<leader>fh", "<cmd>Telescope highlights<CR>", { desc = "Telescope Find highlights" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>f.", "<cmd>Telescope git_bcommits<CR>", { desc = "Telescope Git commits in buffer" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })

-- PLUGIN: trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })

-- PLUGIN: yerbreak
map({ "n", "v" }, "<leader>yb", "<cmd>Yerbreak<CR>", { desc = "Toggle Yerbreak" })
