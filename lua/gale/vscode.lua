local map = vim.keymap.set
local vscode = require "vscode"

map({ "n", "v" }, "<leader>/", "gcc", { remap = true })
map("n", "<leader>ff", function()
  vscode.action "workbench.action.quickOpen"
end, { remap = true })
map("n", "<leader>fw", function()
  vscode.action "workbench.action.quickTextSearch"
end, { remap = true })
