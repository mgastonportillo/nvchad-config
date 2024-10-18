return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function()
    local builtin = require "statuscol.builtin"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "help",
      group = vim.api.nvim_create_augroup("HelpDocsBePure", { clear = true }),
      callback = function()
        if vim.o.ft == "help" then
          vim.o.foldcolumn = "0"
        else
          vim.o.foldcolumn = "1"
        end
      end,
    })

    require("statuscol").setup {
      bt_ignore = { "terminal", "help", "nofile" },
      ft_ignore = { "oil" },
      relculright = true,
      segments = {
        { text = { "%s" }, foldclosed = true, click = "v:lua.ScSa" },
        {
          text = { builtin.foldfunc, "  " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          foldclosed = true,
          click = "v:lua.ScFa",
        },
        { text = { builtin.lnumfunc, " " }, foldclosed = true, click = "v:lua.ScLa" },
      },
    }
  end,
}
