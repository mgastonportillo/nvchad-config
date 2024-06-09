local runtimepath = vim.o.runtimepath
local paths = vim.split(runtimepath, ",")
local search_paths = table.concat(paths, " ")

-- HERE: 
local search_term = "prepend"
local cmd = "rg --vimgrep " .. search_term .. " " .. search_paths

---@param command string
---@param raw? boolean
-- Run a shell command and capture its output
local function os_capture(command, raw)
  local f = assert(io.popen(command, "r"))
  local s = assert(f:read "*a")
  f:close()

  if raw then
    return s
  end

  s = s:gsub("^%s+", ""):gsub("%s+$", ""):gsub("[\n\r]+", "\n")
  return s
end

local result = os_capture(cmd)

-- Process the output into quickfix list items
local qflist = {}
for line in result:gmatch "[^\r\n]+" do
  local filename, lnum, col, text = line:match "([^:]+):(%d+):(%d+):(.*)"
  if filename and lnum and col and text then
    table.insert(qflist, {
      filename = filename,
      lnum = tonumber(lnum),
      col = tonumber(col),
      text = text,
    })
  end
end

vim.fn.setqflist(qflist, "r")

vim.cmd "copen"
