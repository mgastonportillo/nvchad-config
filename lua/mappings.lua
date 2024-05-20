require "nvchad.mappings"
local utils = require "gale.utils"
local map = utils.glb_map
local del = utils.del_map

map("n", ";", ":", { desc = "Enter CMD mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<C-z>", "<NOP>", { desc = "Prevent force-closing with <C-z>" })
map("n", "<leader><F4>", "<cmd>stop<CR>", { desc = "Stop NVIM" })
map("n", "z-", "z^", { desc = "Remap z^ into z- to match z+" })
map("n", "<leader>ih", "<cmd>ToggleInlayHints<CR>", { desc = "Toggle inlay hints" })
-- https://github.com/neovim/neovim/issues/2048
map("i", "<C-h>", "<Esc>cvb", { desc = "Remove a whole word with <C-BS>" })
map("v", "y", "ygv<Esc>", { desc = "Prevent cursor from jumping back to where selection started on yank" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Move lines up/down
map("n", "<A-Down>", ":m .+1<CR>", { desc = "Move line down with <A-Down> in normal mode" })
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down with <A-j> in normal mode" })
map("n", "<A-Up>", ":m .-2<CR>", { desc = "Move line up with <A-Up> in normal mode" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up with <A-k> in normal mode" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down with <A-Down> in insert mode" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down with <A-j> in insert mode" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up with <A-Up> in insert mode" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up with <A-k> in insert mode" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down with <A-Down> in visual mode" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down with <A-j> in visual mode" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up with <A-Up> in visual mode" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up with <A-k> in visual mode" })

-- Quick resize pane
map("n", "<C-A-h>", "5<C-w>>", { desc = "Increase pane width by 5" })
map("n", "<C-A-l>", "5<C-w><", { desc = "Increase pane width by 5" })
map("n", "<C-A-k>", "5<C-w>+", { desc = "Increase pane height by 5" })
map("n", "<C-A-j>", "5<C-w>-", { desc = "Decrease pane height by 5" })

-- TreeSitter
map({ "n", "v" }, "<leader>it", function()
  utils.toggle_inspect_tree()
end, { desc = "TS Toggle Inspect Tree" })
map("n", "<leader>ii", "<cmd>Inspect<CR>", { desc = "TS Inspect under cursor" })

-- Utils
map("n", "<leader>gh", function()
  utils.go_to_github_link()
end, { desc = "Go to GitHub link generated from string" })

--- conform
map("n", "<leader>fm", "<cmd>FormatFile<CR>", { desc = "Format file" })

--- signs
map("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })

--- tabufline
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", i .. "gt", { desc = "Go to tab " .. i })
end

--- telescope
local telescope_lhs_del = { "<leader>fz", "<leader>fh", "<leader>fo", "<leader>gt" }
del("n", telescope_lhs_del)

local all_files = "Telescope find_files follow=true no_ignore=true hidden=true"
map("n", "<leader>fa", "<cmd>" .. all_files .. "<CR>", { desc = "Telescope Search all files" })
map("n", "<leader>f?", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help tags" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Search files" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Search in current file" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Buffers" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope Terms" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope NvChad themes" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP references" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope LSP diagnostics" })
map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "Telescope TreeSitter" })
map("n", "<leader>fz", "<cmd>Telescope builtin<CR>", { desc = "Telescope Builtin list" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
