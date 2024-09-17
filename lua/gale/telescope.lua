-- Inspired in <https://github.com/xzbdmw/nvimconfig/blob/main/lua/custom/telescope-pikers.lua>
-- and <https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1541423345>
local M = {}

local entry_display = require "telescope.pickers.entry_display"
local make_entry = require "telescope.make_entry"
local strings = require "plenary.strings"
local utils = require "telescope.utils"

-- local devicons = require "nvim-web-devicons"
-- local icon_width = strings.strdisplaywidth(devicons.get_icon("fname", { default = true }))
local icon_width = 2 -- offers the best results

local get_path_and_tail = function(file_name)
  local tail = utils.path_tail(file_name)
  local truncated_path = strings.truncate(file_name, #file_name - #tail, "")

  local path = utils.transform_path({
    path_display = { "truncate" },
  }, truncated_path)

  return tail, path
end

---@param filetype "find" | "old"
---@param opts? table
-- Generate a custom file finder picker
local files = function(filetype, opts)
  local files_opts = {
    previewer = false,
    layout_config = {
      horizontal = {
        width = 0.35,
        height = 0.7,
      },
      mirror = false,
    },
  }

  local oldfiles_opts = {
    previewer = false,
    layout_config = {
      prompt_position = "top",
      width = 0.4,
      height = 0.95,
      mirror = true,
      preview_cutoff = 0,
    },
  }

  local picker_data
  if filetype == "find" then
    picker_data = {
      picker = "find_files",
      options = opts and vim.tbl_deep_extend("force", files_opts, opts) or files_opts,
    }
  elseif filetype == "old" then
    picker_data = {
      cwd_only = false,
      picker = "oldfiles",
      options = opts and vim.tbl_deep_extend("force", oldfiles_opts, opts) or oldfiles_opts,
    }
  end

  if type(picker_data) ~= "table" or picker_data.picker == nil then
    return
  end

  local options = picker_data.options or {}
  local base_entry_maker = make_entry.gen_from_file(options)

  options.entry_maker = function(line)
    local base_entry_table = base_entry_maker(line)

    local displayer = entry_display.create {
      separator = " ",
      items = {
        { width = icon_width },
        { width = nil },
        { remaining = true },
      },
    }

    base_entry_table.display = function(entry)
      local tail, path_to_display = get_path_and_tail(entry.value)
      local tail_to_display = tail
      local icon, icon_highlight = utils.get_devicons(tail)

      return displayer {
        { icon, icon_highlight },
        { tail_to_display },
        { path_to_display, "@comment" },
      }
    end

    return base_entry_table
  end

  if picker_data.picker == "find_files" then
    require("telescope.builtin").find_files(options)
  elseif picker_data.picker == "git_files" then
    require("telescope.builtin").git_files(options)
  elseif picker_data.picker == "oldfiles" then
    require("telescope.builtin").oldfiles(options)
  elseif picker_data.picker == "" then
    print "Picker was not specified"
  else
    print "Picker is not supported"
  end
end

---@param search "grep_string" | "egrepify" | "agitator" | "live_grep"
---@param default_text string | nil
---@param filetype string | nil
---@param opts? table
-- Generate a custom live grep picker
local grep = function(search, default_text, filetype, opts)
  local grep_opts = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        prompt_position = "top",
        width = 0.8,
        height = 0.95,
        mirror = true,
        preview_cutoff = 0,
        preview_height = 0.5,
      },
    },
  }

  local picker_data = {
    picker = search,
    options = opts and vim.tbl_deep_extend("force", grep_opts, opts) or grep_opts,
  }

  local escape_for_ripgrep = function(text)
    local escapes = {
      ["\\"] = [[\]],
      ["^"] = [[\^]],
      ["$"] = [[\$]],
      ["."] = [[\.]],
      ["["] = [[\[]],
      ["]"] = "\\]",
      ["("] = [[\(]],
      [")"] = [[\)]],
      ["{"] = [[\{]],
      ["}"] = [[\}]],
      ["*"] = [[\*]],
      ["+"] = [[\+]],
      ["-"] = [[\-]],
      ["?"] = [[\?]],
      ["|"] = [[\|]],
      ["#"] = [[\#]],
      ["&"] = [[\&]],
      ["%"] = [[\%]],
    }

    return text:gsub(".", function(c)
      return escapes[c] or c
    end)
  end

  if default_text then
    if filetype == nil then
      picker_data.options.default_text = default_text
      picker_data.options.initial_mode = "insert"
    else
      local escaped_text = escape_for_ripgrep(default_text)
      local reformated_body = escaped_text:gsub("%s*\r?\n%s*", " ")

      if filetype == "rust" then
        filetype = "rs"
      end

      if filetype ~= "" then
        picker_data.options.default_text = "`" .. filetype .. " " .. reformated_body
      else
        picker_data.options.default_text = reformated_body
      end

      picker_data.options.initial_mode = "normal"
    end
  end

  if type(picker_data) ~= "table" or picker_data.picker == nil then
    return
  end

  local options = picker_data.options or {}
  local base_entry_maker = make_entry.gen_from_vimgrep(options)

  options.entry_maker = function(line)
    local base_entry_table = base_entry_maker(line)

    local displayer = entry_display.create {
      separator = " ",
      items = {
        { width = icon_width },
        { width = nil },
        { remaining = true },
      },
    }

    base_entry_table.display = function(entry)
      local tail, _ = get_path_and_tail(entry.filename)
      local icon, icon_highlight = utils.get_devicons(tail)

      -- Add coordinates if required by `options`
      local coordinates = ""

      if not options.disable_coordinates then
        if entry.lnum then
          coordinates = string.format(":%s", entry.lnum)
        end
      end

      -- Append coordinates to tail
      tail = tail .. coordinates
      local tail_to_display = tail

      -- Encode text if necessary
      local text = options.file_encoding and vim.iconv(entry.text, options.file_encoding, "utf8") or entry.text
      text = "  " .. text

      return displayer {
        { icon, icon_highlight },
        { tail_to_display },
        { text, "@comment" },
      }
    end

    return base_entry_table
  end

  if picker_data.picker == "live_grep" then
    require("telescope.builtin").live_grep(options)
  elseif picker_data.picker == "grep_string" then
    require("telescope.builtin").grep_string(options)
  elseif picker_data.picker == "egrepify" then
    require("telescope").extensions.egrepify.egrepify(options)
  elseif picker_data.picker == "agitator" then
    options.preview = {
      timeout = 10000,
    }
    require("agitator").search_in_added(options)
  elseif picker_data.picker == "" then
    print "Picker was not specified"
  else
    print "Picker is not supported"
  end
end

---@param previewer boolean
---@param opts? table
--- Generate a custom buffer picker
local buffers = function(previewer, opts)
  local buf_opts = {
    bufnr_width = 0,
    layout_strategy = "horizontal",
    previewer = false,
    layout_config = {
      horizontal = {
        width = 0.35,
        height = 0.7,
      },
      mirror = false,
    },
  }

  if previewer then
    buf_opts = opts and vim.tbl_deep_extend("force", buf_opts, opts) or buf_opts
  end

  if buf_opts ~= nil and type(buf_opts) ~= "table" then
    return
  end

  local options = buf_opts or {}
  local base_entry_maker = make_entry.gen_from_buffer(options)

  options.entry_maker = function(line)
    local base_entry_table = base_entry_maker(line)

    local displayer = entry_display.create {
      separator = " ",
      items = {
        { width = icon_width },
        { width = nil },
        { remaining = true },
      },
    }

    base_entry_table.display = function(entry)
      local tail, path = get_path_and_tail(entry.filename)
      local tail_to_display = tail
      local icon, icon_highlight = utils.get_devicons(tail)

      return displayer {
        { icon, icon_highlight },
        { tail_to_display },
        { path, "@comment" },
      }
    end

    return base_entry_table
  end

  require("telescope.builtin").buffers(options)
end

M.pickers = {
  files = files,
  grep = grep,
  buffers = buffers,
}

return M
