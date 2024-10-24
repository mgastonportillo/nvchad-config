return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function()
    local builtin = require "statuscol.builtin"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("SmarterFoldColumn", { clear = true }),
      callback = function(event)
        if vim.bo[event.buf].buftype == "help" then
          vim.opt_local.foldcolumn = "0"
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
