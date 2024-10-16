vim.cmd [[
  function! LspHealthCheck(...)
    LspInfo
  endfunction
]]

vim.cmd [[
  function! RunNeogit(...)
    lua require("neogit").open()
  endfunction
]]

vim.cmd [[
  function! RunHarpoon(...)
    RunHarpoon
  endfunction
]]
