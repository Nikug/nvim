local M = {}
local api = vim.api

function M.set_keymap(map, input, command, options)
	options = options or { noremap = true }
	api.nvim_set_keymap(map, input, command, options)
end

function M.new_visual_selection(selectionStart, selectionEnd)
	vim.fn.setpos(".", { 0, selectionStart, 0 })
	api.nvim_command("normal! v")
	vim.fn.setpos(".", { 0, selectionEnd, 2147483647 })
end

function M.vscode_move_lines(direction)
	local _, startRow = table.unpack(vim.fn.getpos("'<"))
	local _, endRow = table.unpack(vim.fn.getpos("'>"))
	local topLine = 1
	local botLine = api.nvim_eval('line("$")')

	-- Check file boundaries
	if startRow == topLine and direction == "Up" then
		M.new_visual_selection(startRow, endRow)
		return
	elseif endRow == botLine and direction == "Down" then
		M.new_visual_selection(startRow, endRow)
		return
	end
	-- Call VS Code move lines
	local removeVsCodeSelectionAfterCommand = 1
	local vsCodeCommand = string.format("editor.action.moveLines%sAction", direction)
	local vimCommand = string.format(
		"call VSCodeCallRange('%s',%s,%s,%s)",
		vsCodeCommand,
		startRow,
		endRow,
		removeVsCodeSelectionAfterCommand
	)
	api.nvim_exec(vimCommand, false)

	-- Calculate new visual selection and update it
	local newStart, newEnd
	if direction == "Up" then
		newStart = startRow - 1
		newEnd = endRow - 1
	else
		newStart = startRow + 1
		newEnd = endRow + 1
	end

	M.new_visual_selection(newStart, newEnd)
end

function M.save()
	local file_name = vim.fn.expand("%:r")
	if vim.o.buftype == "nofile" or file_name == "" then
		M.save_as()
		return
	end

	vim.lsp.buf.format({ async = false })
	vim.cmd("w")
end

function M.save_as()
	local path = vim.fn.expand("%:p")
	if path == "" then
		path = vim.fn.expand("#:p:h") .. "/"
	end
	if path == "/" then
		path = "~/"
	end

	vim.ui.input({ prompt = "Save as: ", default = path, completion = "file" }, function(file)
		if file == nil then
			print("File save cancelled")
			return
		end
		vim.cmd("w " .. file)
		vim.cmd("e " .. file)
	end)
end

function M.new_file()
	local path = vim.fn.expand("%:p")
	if path == "" then
		path = vim.fn.expand("#:p:h") .. "/"
	end
	if path == "/" then
		path = "~/"
	end

	vim.ui.input({ prompt = "New file: ", default = path, completion = "file" }, function(file)
		if file == nil then
			print("New file cancelled")
			return
		end
		vim.cmd(string.format("enew %s", file))
	end)
end

function M.set_working_directory()
	local path = vim.fn.expand("%:p:h")
	if path == "/" then
		path = "~/"
	end

	vim.ui.input({ prompt = "Open folder: ", default = path, completion = "file" }, function(newPath)
		if newPath == nil then
			print("Changing directory cancelled")
			return
		end
		vim.cmd("wa")
		vim.cmd("bufdo bwipeout")
		vim.cmd(string.format("cd %s", newPath))
		require("alpha").start(false)
	end)
end

function M.includes(array, value)
	for _, item in ipairs(array) do
		if item == value then
			return true
		end
	end

	return false
end

function M.is_in_git_repo()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	return vim.v.shell_error == 0
end

function M.search_files()
	local in_git = M.is_in_git_repo()
	if in_git then
		require("fzf-lua").git_files({ cmd = "git ls-files --others --cached --exclude-standard -- . ':!:*.yarn/**'" })
	else
		require("fzf-lua").files()
	end
end

function M.reload_config()
	print("Reloading user configuration...")
	print("Modules:")
	for name, _ in pairs(package.loaded) do
		if name:match("^user.") and not name:match("nvim-tree") then
			print("- " .. name)
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	print("Nvim configuration loaded.")
end

return M
