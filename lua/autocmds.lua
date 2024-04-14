local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Add support for .mdx files.",
  group = augroup("mdx_support", { clear = true }),
  pattern = { "*.mdx" },
  callback = function()
    vim.api.nvim_set_option_value("filetype", "markdown", { scope = "local" })
  end,
})

autocmd("VimResized", {
  desc = "Auto resize panes when resizing nvim window.",
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("VimLeavePre", {
  desc = "Close NvimTree before quitting nvim.",
  pattern = { "<buffer>", "*" },
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      vim.api.nvim_buf_delete(0, { force = true })
    end
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight on yank.",
  group = augroup("YankHighlight", { clear = true }),
  command = "silent! lua vim.highlight.on_yank({higroup='YankVisual', timeout=200})",
})

autocmd("ModeChanged", {
  desc = "Strategically disable diagnostics to focus on editing tasks.",
  group = augroup("user_diagnostic", { clear = true }),
  pattern = { "n:i", "n:v", "i:v" },
  command = "lua vim.diagnostic.disable(0)",
})

autocmd({ "BufRead", "BufNewFile" }, {
  desc = "Disable diagnostics in node_modules.",
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)",
})

autocmd("ModeChanged", {
  desc = "Enable diagnostics upon exiting insert mode to resume feedback.",
  group = augroup("user_diagnostic", { clear = true }),
  pattern = "i:n",
  command = "lua vim.diagnostic.enable(0)",
})

autocmd("BufWritePre", {
  desc = "Remove trailing whitespaces on save.",
  group = augroup("TrimWhiteSpaceGrp", { clear = true }),
  command = [[:%s/\s\+$//e]],
})

autocmd("FileType", {
  desc = "Define windows to close with 'q'",
  pattern = {
    "empty",
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "man",
    "checkhealth",
    "nvcheatsheet",
  },
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    set nobuflisted
  ]],
})

autocmd("VimEnter", {
  desc = "Open file on creation (NvimTree).",
  callback = function()
    require("nvim-tree.api").events.subscribe("FileCreated", function(file)
      vim.cmd("edit " .. file.fname)
    end)
  end,
})

autocmd("BufHidden", {
  desc = "Delete [No Name] buffers.",
  callback = function(event)
    if event.file == "" and vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, event.buf, {})
      end)
    end
  end,
})

autocmd("BufEnter", {
  nested = true,
  desc = "Ensure NvimTree is focused and visible after closing last open buffer.",
  group = augroup("nvimtree_force_last_open", { clear = true }),
  callback = function()
    local api = require "nvim-tree.api"
    -- Check if there's only one window left and the last buffer closed was a file buffer
    if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
      -- It's necessary to defer the action to let the close event complete
      vim.defer_fn(function()
        -- Close NvimTree, ensuring it will return to the last hidden buffer
        api.tree.toggle { find_file = true, focus = true }
        -- Reopen NvimTree to ensure it's focused and visible
        api.tree.toggle { find_file = true, focus = true }
        -- Ensure NvimTree is still the active window, switch to the previous window
        vim.cmd "wincmd p"
      end, 0)
    end
  end,
})

autocmd({ "ModeChanged" }, {
  -- https://github.com/L3MON4D3/LuaSnip/issues/258
  desc = "Prevent weird snippet jumping behavior.",
  pattern = { "s:n", "i:*" },
  callback = function()
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Automatically update changed file in nvim.",
  command = [[
    silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif
  ]],
})

-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd("FileChangedShellPost", {
  desc = "Show notification on file change.",
  command = [[
    echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]],
})
