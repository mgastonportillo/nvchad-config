vim.filetype.add {
  extension = {
    jsonl = "json",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  desc = "Unattach jsonls from jsonl buffers.",
  pattern = "json",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if client.name == "jsonls" and bufname:match "%.jsonl$" then
      vim.schedule(function()
        vim.lsp.stop_client(client.id)
      end)
    end
  end,
})
