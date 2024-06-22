local M = {}
local autocmd = vim.api.nvim_create_autocmd
local container_name = "pensive_blackburn"

local is_container_running = function(container)
  local handle = io.popen('docker ps --filter "name=' .. container .. '" --filter "status=running" -q')
  local result
  if handle then
    result = handle:read "*a"
    handle:close()
  end
  return result ~= ""
end

local start_docker_container = function()
  if not is_container_running(container_name) then
    local command = "docker start " .. container_name
    os.execute(command)
    vim.notify.dismiss { silent = true, pending = true } ---@diagnostic disable-line
    vim.notify(" Docker: Tabby started!", vim.log.levels.INFO, { icon = "" })
  else
    vim.notify.dismiss { silent = true, pending = true } ---@diagnostic disable-line
    vim.notify(" Docker: Tabby is already running!", vim.log.levels.WARN, { icon = "" })
  end
end

local stop_docker_container = function()
  if is_container_running(container_name) then
    local command = "docker stop " .. container_name
    vim.fn.jobstart(command, {
      detach = true,
      on_exit = function(_, code, _)
        if code == 0 then
          vim.notify.dismiss { silent = true, pending = true } ---@diagnostic disable-line
          vim.notify(" Docker: Tabby stopped!", vim.log.levels.WARN, { icon = "" })
        end
      end,
    })
  end
end

M.start = start_docker_container
M.stop = stop_docker_container

if vim.g.loaded_tabby == 1 then
  --[[ autocmd("VimEnter", {
    callback = function()
      start_docker_container()
    end,
  })
]]
  autocmd("VimLeave", {
    callback = function()
      stop_docker_container()
    end,
  })
end

return M
