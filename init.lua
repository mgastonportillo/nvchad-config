vim.g.mapleader = " "

if vim.g.vscode then
  require "gale.vscode"
else
  require "gale.globals"
  require "bootstrap"
  require "gale.filetypes"
  require "gale.usercmds"
  require "gale.autocmds"
  require "gale.aliases"
  require "gale.wsl"
  require "gale.linux"
  require "gale.vim"
  require "options"
  require "mappings"
end
