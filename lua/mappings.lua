local utils = require "gale.utils"
local map = utils.glb_map

map("n", ";", ":", { desc = "Enter CMD mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy file content" })
map("n", "<C-z>", "<NOP>", { desc = "Unmap force closing with <C-z>" })
map("n", "<leader><F4>", "<cmd>stop<CR>", { desc = "Stop NVIM" })
map("n", "z-", "z^", { desc = "Remap z^ into z- to match z+" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlights" })
-- https://github.com/neovim/neovim/issues/2048
map("i", "<C-h>", "<Esc>cvb", { desc = "Remove word" })
map("v", "y", "ygv<Esc>", { desc = "Yank preventing cursor from jumping back to where selection started" })
map("n", "<leader>of", function()
  vim.ui.open(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h"))
end, { desc = "Open file location in file explorer" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Go to buffer point
map("i", "<C-b>", "<ESC>^i", { desc = "Go to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Go to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Go to left" })
map("i", "<C-l>", "<Right>", { desc = "Go to right" })
map("i", "<C-j>", "<Down>", { desc = "Go down" })
map("i", "<C-k>", "<Up>", { desc = "Go up" })

-- Move lines up/down
map("n", "<A-Down>", ":m .+1<CR>", { desc = "Move line down with <A-Down> in normal mode" })
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down with <A-j> in normal mode" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up with <A-k> in normal mode" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down with <A-Down> in insert mode" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down with <A-j> in insert mode" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up with <A-Up> in insert mode" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up with <A-k> in insert mode" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down with <A-Down> in visual mode" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down with <A-j> in visual mode" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up with <A-Up> in visual mode" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up with <A-k> in visual mode" })

-- Switch buffers
map("n", "<C-h>", "<C-w>h", { desc = "Buffer switch left" })
map("n", "<C-l>", "<C-w>l", { desc = "Buffer switch right" })
map("n", "<C-j>", "<C-w>j", { desc = "Buffer switch down" })
map("n", "<C-k>", "<C-w>k", { desc = "Buffer switch up" })

-- Quick resize pane
map({ "n", "t" }, "<C-A-h>", "5<C-w>>", { desc = "Window increase width by 5" })
map({ "n", "t" }, "<C-A-l>", "5<C-w><", { desc = "Window decrease width by 5" })
map({ "n", "t" }, "<C-A-k>", "5<C-w>+", { desc = "Window increase height by 5" })
map({ "n", "t" }, "<C-A-j>", "5<C-w>-", { desc = "Window decrease height by 5" })

-- Togglers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ih", "<cmd>ToggleInlayHints<CR>", { desc = "Toggle inlay hints" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- Term
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Term escape terminal mode" })

map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "Term new horizontal split" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "Term new vertical split" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Term toggle vertical split" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Term toggle horizontal split" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Term toggle floating" })

-- TreeSitter
map({ "n", "v" }, "<leader>it", function()
  utils.toggle_inspect_tree()
end, { desc = "TreeSitter toggle inspect tree" })

map("n", "<leader>ii", "<cmd>Inspect<CR>", { desc = "TreeSitter inspect under cursor" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Utils
map("n", "gh", function()
  utils.go_to_github_link()
end, { desc = "Go to GitHub link generated from string" })

--- Tabufline
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer go to next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer go to prev" })

map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer new" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer close" })

for i = 1, 9 do
  map("n", "<A-" .. i .. ">", i .. "gt", { desc = "Tab go to tab " .. i })
end
