local normalise = vim.fs.normalize
local config = vim.fn.stdpath "config"
local modules = { "/lua/plugins/local", "/lua/plugins/spec", "/lua/plugins/override" }
local output = normalise(config .. "/lua/plugins") .. "/init.lua"

---@param tbl table
local reverse_table_in_place = function(tbl)
  local len = #tbl
  for i = 1, math.floor(len / 2) do
    tbl[i], tbl[len - i + 1] = tbl[len - i + 1], tbl[i]
  end
end

---@param module_path string
local normalise_module = function(module_path)
  local modified_str, _ = module_path:gsub("/", "", 1):gsub("/", ".")
  return modified_str
end

---@param path string
local get_specs_from_path = function(path)
  local specs_paths = {}
  for file, _ in vim.fs.dir(normalise(config .. path)) do
    table.insert(specs_paths, normalise_module(path:gsub("lua/", "")) .. "." .. file:gsub(".lua", ""))
  end
  return specs_paths
end

---@param file_path string
---@param content string | number
local write_file = function(file_path, content)
  local file = assert(io.open(file_path, "w"))
  if not file then
    print "Error: Could not open output file for writing."
    return
  end

  file:write(content)
  file:close()
end

local generate_imports = function()
  local insertion_index = 2
  local content = {
    "return {",
    "}",
    "",
  }

  local spec_path_list = {}
  for _, dir in ipairs(modules) do
    local raw_specs_paths = get_specs_from_path(dir)
    for _, spec_path in ipairs(raw_specs_paths) do
      table.insert(spec_path_list, spec_path)
    end
  end

  local imports = {}
  for _, str in ipairs(spec_path_list) do
    table.insert(imports, string.format('{ import = "%s" },', str))
  end

  reverse_table_in_place(imports)
  for _, str in ipairs(imports) do
    table.insert(content, insertion_index, string.rep(" ", vim.o.tabstop) .. str)
  end

  write_file(output, table.concat(content, "\n"))
  print(#imports .. " imports written to " .. output)
end

generate_imports()
