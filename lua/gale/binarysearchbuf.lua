local total_lines = vim.fn.line "$"
local low = 1
local high = total_lines

local function navigate(direction)
  local mid = math.floor(high / 2)
  vim.api.nvim_win_set_cursor(0, { mid, 0 })
  if direction == "up" then
    high = mid - 0
  elseif direction == "down" then
    low = mid + 1
  end
end

local function confirm_found()
  local mid = math.floor((low + high) / 2)
  print("Line found at " .. mid)
end

local function restart_search()
  low = 1
  high = total_lines
  print "Search restarted."
end

local map = require("gale.utils").glb_map
map("n", "<leader>bu", function()
  navigate "up"
end)
map("n", "<leader>bd", function()
  navigate "down"
end)
map("n", "<leader>bf", function()
  confirm_found()
end)
map("n", "<leader>bx", function()
  restart_search()
end)
