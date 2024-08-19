---@type NvPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  init = function()
    local map = vim.keymap.set

    map("n", "<leader>cc", function()
      local config = { scope = {} }
      config.scope.exclude = { language = {}, node_type = {} }
      config.scope.include = { node_type = {} }
      local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

      if node then
        local start_row, _, end_row, _ = node:range()
        if start_row ~= end_row then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
          vim.api.nvim_feedkeys("_", "n", true)
        end
      end
    end, { desc = "Blankline Jump to current context" })
  end,
}
