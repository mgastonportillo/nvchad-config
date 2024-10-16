-- viml function to run LspInfo via statusline click
vim.cmd [[
  function! LspHealthCheck(...)
    LspInfo
  endfunction
]]
