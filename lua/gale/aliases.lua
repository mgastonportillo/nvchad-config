local alias = function(target_cmd, alias)
  vim.cmd("ca " .. alias .. " " .. target_cmd)
end

-- Workaround my dumb fingers
alias("qa", "Qa")
alias("qa", "QA")
alias("q", "Q")
alias("w", "W")
