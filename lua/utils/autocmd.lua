local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.g.CAPSON = "Unknown"

autocmd({ "ModeChanged", "BufWrite" }, {
	desc = "Get Caps Status",
	group = vim.api.nvim_create_augroup("GetCapsStatus", { clear = true }),
	callback = function()
		vim.fn.jobstart('pwsh.exe -c "[console]::CapsLock"', {
			on_stdout = function(_, data)
				local output = vim.trim(data[1])

				if output ~= "" then
					vim.g.CAPSON = output

					vim.fn.timer_start(0, function()
						vim.cmd("redrawstatus")
					end)
				end
			end,
		})
	end,
})

autocmd("VimResized", {
	desc = "Auto resize panes when resizing nvim window",
	pattern = "*",
	command = "tabdo wincmd =",
})

autocmd("FileType", {
	desc = "Close NvimTree before quit nvim",
	pattern = { "NvimTree" },
	callback = function(args)
		autocmd("VimLeavePre", {
			callback = function()
				vim.api.nvim_buf_delete(args.buf, { force = true })
				return true
			end,
		})
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight on yank",
	command = "silent! lua vim.highlight.on_yank({higroup='YankVisual', timeout=200})",
	group = augroup("YankHighlight", { clear = true }),
})

autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("user_diagnostic", { clear = true }),
	pattern = { "n:i", "n:v", "i:v" },
	command = "lua vim.diagnostic.disable(0)",
})

autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("user_diagnostic", { clear = true }),
	pattern = "i:n",
	command = "lua vim.diagnostic.enable(0)",
})

-- Show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = augroup("CursorLine", { clear = true }),
})
autocmd({ "InsertEnter", "WinLeave" }, {
	pattern = "*",
	command = "set nocursorline",
	group = augroup("CursorLine", { clear = true }),
})

-- Remove all trailing whitespace on save
autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = augroup("TrimWhiteSpaceGrp", { clear = true }),
})

-- Windows to close with "q"
autocmd("FileType", {
	pattern = {
		"empty",
		"help",
		"startuptime",
		"qf",
		"lspinfo",
		"man",
		"checkhealth",
	},
	command = [[
    nnoremap <buffer><silent> q :close<CR>
    set nobuflisted
  ]],
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*/node_modules/*",
	command = "lua vim.diagnostic.disable(0)",
})

-- Nvimtree open file on creation
local function open_file_created()
	require("nvim-tree.api").events.subscribe("FileCreated", function(file)
		vim.cmd("edit " .. file.fname)
	end)
end

autocmd({ "VimEnter" }, {
	callback = open_file_created,
})

-- Delete [No Name] buffers,
autocmd("BufHidden", {
	callback = function(event)
		if event.file == "" and vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

autocmd("BufEnter", {
	nested = true,
	callback = function()
		local api = require("nvim-tree.api")
		-- Only 1 window with nvim-tree left: we probably closed a file buffer
		if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
			-- Required to let the close event complete. An error is thrown without this.
			vim.defer_fn(function()
				-- close nvim-tree: will go to the last hidden buffer used before closing
				api.tree.toggle({ find_file = true, focus = true })
				-- re-open nivm-tree
				api.tree.toggle({ find_file = true, focus = true })
				-- nvim-tree is still the active window. Go to the previous window.
				vim.cmd("wincmd p")
			end, 0)
		end
	end,
})

-- Prevent weird snippet jumping behavior
-- https://github.com/L3MON4D3/LuaSnip/issues/258
autocmd({ "ModeChanged" }, {
	pattern = { "s:n", "i:*" },
	callback = function()
		if
			require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})

-- Automatically update changed file in Vim
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd("FileChangedShellPost", {
	command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
})

-- GROUP: [[ NEED DEBUGGING ]]

-- autocmd("BufEnter", {
-- 	desc = "Prevent auto comment new line",
-- 	command = [[set formatoptions-=cro]],
-- })
--
-- -- Prevent comment from being inserted when entering new line in existing comment
-- autocmd("BufEnter", {
-- 	callback = function()
-- 		-- Allow <CR> to continue block comments only
-- 		-- https://stackoverflow.com/questions/10726373/auto-comment-new-line-in-vim-only-for-block-comments
-- 		vim.opt.comments:remove("://")
-- 		vim.opt.comments:remove(":--")
-- 		vim.opt.comments:remove(":#")
-- 		vim.opt.comments:remove(":%")
-- 	end,
-- })

-- autocmd("BufEnter", {
-- 	callback = function()
-- 		for k, v in pairs(vim.opt.formatoptions) do
-- 			if k == "_value" then
-- 				print(v)
-- 			end
-- 		end
-- 		if vim.opt.formatoptions ~= nil then
-- 			vim.opt.formatoptions = vim.opt.formatoptions - "o"
-- 		end
-- 	end,
-- })

-- autocmd("BufEnter", {
-- 	callback = function()
-- 		local old = vim.o.comments
-- 		print("vim.o.comments is:", vim.o.comments)
--
-- 		local patterns = { ":---", ":--", "://", ":#", "%" }
--
-- 		local new = old:gsub("%f[%c]", function(match)
-- 			if table.find(patterns, match) then
-- 				return "f0" .. match
-- 			else
-- 				return match
-- 			end
-- 		end)
--
-- 		if old ~= new then
-- 			print("vim.o.comments is:", vim.o.comments) -- Inspect the value
-- 		end
-- 	end,
-- })
