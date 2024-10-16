local utils = require "gale.utils"
local map = utils.glb_map

map("n", "z-", "z^") -- Remap z^ into z- for convenience
map("n", "g-", "g;") -- Remap g; into g- for convenience
map("n", ";", ":", { desc = "General enter CMD mode" })
map("i", "jk", "<ESC>", { desc = "General exit insert mode" })
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "General save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General copy file content" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear search highlights" })
map("n", "<leader>cs", "<cmd><CR>", { desc = "General clear statusline" })
map("n", "<leader><F4>", "<cmd>stop<CR>", { desc = "Genaral stop NVIM" })
map("n", "<leader>cm", "<cmd>mes clear<CR>", { desc = "General clear messages" })
-- https://github.com/neovim/neovim/issues/2048
map("i", "<A-BS>", "<C-w>", { desc = "General remove word" })

map("n", "<leader>ol", function()
  vim.ui.open(vim.fn.expand "%:p:h")
end, { desc = "General open file location in file explorer" })

-- Yank/Paste/Delete/Cut improvements
-- An attempt to workaround https://github.com/neovim/neovim/issues/29712
map("n", "yy", '"0yy', { desc = "Yank line" })
map("n", "<C-yy>", '"+yy', { desc = "Yank line (+)" })
map("n", "Y", '"0yiWE', { desc = "Yank word" })
map("n", "<C-Y>", '"+yiWE', { desc = "Yank word (+)" })
map("n", "p", '"0p', { desc = "Paste below" })
map("n", "<C-p>", '"+p', { desc = "Paste below (+)" })
map("n", "P", '"0P', { desc = "Paste above" })
map("n", "<C-P>", '"+P', { desc = "Paste above (+)" })
map("n", "x", '"0x', { desc = "Delete character" })
map("n", "<C-x>", '"0x', { desc = "Delete character (x)" })
map("n", "dd", '"0dd', { desc = "Delete line" })
map("n", "cc", '"0cc', { desc = "Change line" })
map("v", "y", '"0ygv<Esc>', { desc = "Yank selection" })
map("v", "<C-y>", '"+ygv<Esc>', { desc = "Yank selection (+)" })
map("v", "<C-d>", '"0d', { desc = "Delete selection" })
map("v", "<C-c>", '"0c', { desc = "Change selection" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Buffer motions
map("i", "<C-b>", "<ESC>^i", { desc = "Go to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Go to end of line" })
map("i", "<C-A-h>", "<Left>", { desc = "Go to left" })
map("i", "<C-A-l>", "<Right>", { desc = "Go to right" })
map("i", "<C-A-j>", "<Down>", { desc = "Go down" })
map("i", "<C-A-k>", "<Up>", { desc = "Go up" })
map("n", "<leader>gm", "<cmd>exe 'normal! ' . line('$')/2 . 'G'<CR>", { desc = "Go to middle of the file" })

-- Move lines up/down
map("n", "<A-Down>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-Up>", ":m .-2<CR>", { desc = "Move line up" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Switch buffers
map("n", "<C-h>", "<C-w>h", { desc = "Buffer switch left" })
map("n", "<C-l>", "<C-w>l", { desc = "Buffer switch right" })
map("n", "<C-j>", "<C-w>j", { desc = "Buffer switch down" })
map("n", "<C-k>", "<C-w>k", { desc = "Buffer switch up" })

-- Quick resize pane
map("n", "<C-A-h>", "5<C-w>>", { desc = "Window increase width by 5" })
map("n", "<C-A-l>", "5<C-w><", { desc = "Window decrease width by 5" })
map("n", "<C-A-k>", "5<C-w>+", { desc = "Window increase height by 5" })
map("n", "<C-A-j>", "5<C-w>-", { desc = "Window decrease height by 5" })

-- Togglers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ih", "<cmd>ToggleInlayHints<CR>", { desc = "Toggle inlay hints" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Minty
map("n", "<leader>cp", function()
  require("minty.huefy").open()
end, { desc = "Open color picker" })

-- NvChad
map("n", "<leader>th", function()
  require("nvchad.themes").open { style = "flat" }
end, { desc = "Open theme picker" })

-- NvMenu
--[[ local menus = utils.menus
map({ "n", "v" }, "<C-t>", function()
  require("menu").open(menus.main)
end, { desc = "Open NvChad menu" })

map({ "n", "v" }, "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  require("menu").open(menus.main, { mouse = true })
end, { desc = "Open NvChad menu" }) ]]

-- Term
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Term escape terminal mode" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Term toggle vertical split" })

map({ "n", "t" }, "<C-A-v>", function()
  require("nvchad.term").toggle {
    pos = "vsp",
    id = "vtoggleTermLoc",
    cmd = "cd " .. vim.fn.expand "%:p:h",
  }
end, { desc = "Term toggle vertical split in buffer location" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Term toggle horizontal split" })

map({ "n", "t" }, "<A-S-S-h>", function()
  require("nvchad.term").toggle {
    pos = "sp",
    id = "htoggleTermLoc",
    cmd = "cd " .. vim.fn.expand "%:p:h",
  }
end, { desc = "Term toggle horizontal split in buffer location" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Term toggle floating" })

map({ "n", "t" }, "<A-S-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTermLoc",
    cmd = "cd " .. vim.fn.expand "%:p:h",
  }
end, { desc = "Term toggle floating in buffer location" })

-- TreeSitter
map({ "n", "v" }, "<leader>it", function()
  utils.toggle_inspect_tree()
end, { desc = "TreeSitter toggle inspect tree" })

map("n", "<leader>ii", "<cmd>Inspect<CR>", { desc = "TreeSitter inspect under cursor" })

--- Tabufline
local tabufline = require "nvchad.tabufline"

map("n", "<Tab>", function()
  tabufline.next()
end, { desc = "Buffer go to next" })

map("n", "<S-Tab>", function()
  tabufline.prev()
end, { desc = "Buffer go to prev" })

map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<leader>bh", "<cmd>split | enew<CR>", { desc = "Buffer new horizontal split" })
map("n", "<leader>bv", "<cmd>vsplit | enew<CR>", { desc = "Buffer new vertical split" })

map("n", "<leader>x", function()
  tabufline.close_buffer()
end, { desc = "Buffer close" })

for i = 1, 9 do
  map("n", "<A-" .. i .. ">", i .. "gt", { desc = "Tab go to tab " .. i })
end

map("n", "<A-Left>", function()
  tabufline.move_buf(-1)
end, { desc = "Tabufline move buffer to the left" })

map("n", "<A-Right>", function()
  tabufline.move_buf(1)
end, { desc = "Tabufline move buffer to the right" })

map("n", "<A-|>", "<cmd>TabuflineToggle<CR>", { desc = "Tabufline toggle visibility" })

-- Utils
map("n", "gh", function()
  utils.go_to_github_link()
end, { desc = "Go to GitHub link generated from string" })

map(
  "n",
  "<leader>rl",
  "<cmd>s/[a-zA-Z]/\\=nr2char((char2nr(submatch(0)) - (char2nr(submatch(0)) >= 97 ? 97 : 65) + 13) % 26 + (char2nr(submatch(0)) >= 97 ? 97 : 65))/g<CR>",
  { desc = "_ Mum and dad were having fun" }
)

map("n", "<leader>rf", function()
  vim.cmd [[%s/[a-zA-Z]/\=nr2char((char2nr(submatch(0)) - (char2nr(submatch(0)) >= 97 ? 97 : 65) + 13) % 26 + (char2nr(submatch(0)) >= 97 ? 97 : 65))/g]]
end, { desc = "_ Mum and dad were having fun" })
