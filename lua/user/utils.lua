local M = {}

function M.save()
	require("conform").format({ async = false })
	vim.cmd("w")
end

function M.is_in_git_repo()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	return vim.v.shell_error == 0
end

function M.search_files()
	local in_git = M.is_in_git_repo()
	if in_git then
		require("telescope.builtin").git_files({
			cmd = "git ls-files --others --cached --exclude-standard -- . ':!:*.yarn/**'",
		})
	else
		require("telescope.builtin").find_files()
	end
end

return M
