local M = {}

function M.setup()
	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
	vim.keymap.set({ "n", "x" }, "<C-p>", "<Plug>(YankyCycleBackward)")
	vim.keymap.set({ "n", "x" }, "<C-n>", "<Plug>(YankyCycleForward)")
end

return M
