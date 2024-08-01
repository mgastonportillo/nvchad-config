local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local utils = require "gale.utils"
local buf_map = utils.buf_map

autocmd("BufLeave", {
  desc = "Hide tabufline if only one buffer and one tab are open.",
  pattern = "*",
  group = augroup("TabuflineHide", { clear = true }),
  callback = function()
    vim.schedule(function()
      if #vim.t.bufs <= 1 and #vim.api.nvim_list_tabpages() <= 1 then
        vim.o.showtabline = 0
      else
        vim.o.showtabline = 2
      end
    end)
  end,
})

autocmd("Filetype", {
  desc = "Prevent <Tab>/<S-Tab> from switching specific buffers.",
  pattern = {
    "codecompanion",
    "lazy",
    "qf",
  },
  group = augroup("PreventBufferSwap", { clear = true }),
  callback = function(event)
    local lhs_list = { "<Tab>", "<S-Tab>" }
    buf_map(event.buf, "n", lhs_list, "<nop>")
  end,
})

autocmd("FileType", {
  desc = "Workaround for NvCheatsheet's zindex being higher than Mason's.",
  pattern = "nvcheatsheet",
  group = augroup("FixCheatsheetZindex", { clear = true }),
  callback = function()
    vim.api.nvim_win_set_config(0, { zindex = 44 })
  end,
})

autocmd({ "BufEnter", "FileType" }, {
  desc = "Prevent auto-comment on new line.",
  pattern = "*",
  group = augroup("NoNewLineComment", { clear = true }),
  command = [[
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  ]],
})

autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Add support for .mdx files.",
  pattern = { "*.mdx" },
  group = augroup("MdxSupport", { clear = true }),
  callback = function()
    vim.api.nvim_set_option_value("filetype", "markdown", { scope = "local" })
  end,
})

autocmd("VimResized", {
  desc = "Auto resize panes when resizing nvim window.",
  pattern = "*",
  group = augroup("VimAutoResize", { clear = true }),
  command = [[ tabdo wincmd = ]],
})

autocmd("VimLeavePre", {
  desc = "Close NvimTree before quitting nvim.",
  pattern = "*",
  group = augroup("NvimTreeCloseOnExit", { clear = true }),
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      vim.api.nvim_buf_delete(0, { force = true })
    end
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight on yank.",
  group = augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "YankVisual", timeout = 200, on_visual = true }
  end,
})

autocmd("ModeChanged", {
  desc = "Strategically disable diagnostics to focus on editing tasks.",
  pattern = { "n:i", "n:v", "i:v" },
  group = augroup("UserDiagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  desc = "Disable diagnostics in node_modules.",
  pattern = "*/node_modules/*",
  group = augroup("UserDiagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

autocmd("ModeChanged", {
  desc = "Enable diagnostics upon exiting insert mode to resume feedback.",
  pattern = "i:n",
  group = augroup("UserDiagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.enable(true)
  end,
})

autocmd("BufWritePre", {
  desc = "Remove trailing whitespaces on save.",
  group = augroup("TrimWhitespaceOnSave", { clear = true }),
  command = [[ %s/\s\+$//e ]],
})

autocmd("FileType", {
  desc = "Define windows to close with 'q'",
  pattern = {
    "empty",
    "help",
    "startuptime",
    "qf",
    "query",
    "lspinfo",
    "man",
    "checkhealth",
    "nvcheatsheet",
    "codecompanion",
  },
  group = augroup("WinCloseOnQDefinition", { clear = true }),
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    set nobuflisted
  ]],
})

autocmd("BufHidden", {
  desc = "Delete [No Name] buffers.",
  group = augroup("DeleteNoNameBuffer", { clear = true }),
  callback = function(event)
    if event.file == "" and vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, event.buf, {})
      end)
    end
  end,
})

autocmd("ModeChanged", {
  -- https://github.com/L3MON4D3/LuaSnip/issues/258
  desc = "Prevent weird snippet jumping behavior.",
  pattern = { "s:n", "i:*" },
  group = augroup("PreventSnippetJump", { clear = true }),
  callback = function()
    local ls = require "luasnip"
    local bufnr = vim.api.nvim_get_current_buf()

    if ls.session.current_nodes[bufnr] and not ls.session.jump_active then
      ls.unlink_current()
    end
  end,
})

-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Automatically update changed file in nvim.",
  group = augroup("AutoupdateOnFileChange", { clear = true }),
  command = [[
    silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif
  ]],
})

-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd("FileChangedShellPost", {
  desc = "Show notification on file change.",
  group = augroup("NotifyOnFileChange", { clear = true }),
  command = [[
    echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]],
})

autocmd("User", {
  desc = "Enable line number in Telescope preview.",
  pattern = "TelescopePreviewerLoaded",
  group = augroup("CustomTelescopePreview", { clear = true }),
  callback = function()
    vim.opt_local.number = true
  end,
})

autocmd("TermOpen", {
  desc = "Prevent left click on terminal buffers from exiting insert mode.",
  pattern = "*",
  group = augroup("LeftMouseClickTerm", { clear = true }),
  callback = function(event)
    local mouse_actions = {
      "<LeftMouse>",
      "<2-LeftMouse>",
      "<3-LeftMouse>",
      "<4-LeftMouse>",
    }
    buf_map(event.buf, "t", mouse_actions, "<nop>")
  end,
})

autocmd("FileType", {
  desc = "Set custom conceal level in markdown files.",
  pattern = "*",
  callback = function()
    if vim.bo.ft == "markdown" then
      vim.opt.conceallevel = 2
    else
      vim.opt.conceallevel = 0
    end
  end,
})
