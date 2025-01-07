local which_key = require("which-key")
vim.keymap.set("n", "<F1>", "<nop>")
vim.keymap.set("i", "<F1>", "<nop>")
vim.keymap.set("x", "<F1>", "<nop>")

-- Normal mode
which_key.add({
	{
		mode = "n",
		{ "<leader><leader>", [[<Cmd>lua require("user.utils").search_files()<CR>]], desc = "Search files" },
		{ "<leader>b", "<Cmd>Telescope buffers<CR>", desc = "Search buffers" },
		{ "<leader>a", "<Cmd>Telescope find_files<CR>", desc = "Search all files" },
		{ "<leader>/", "<Cmd>Telescope live_grep<CR>", desc = "Search text" },

		{ "<leader>f", group = "file" },
		{ "<leader>fs", [[<Cmd>lua require('user.utils').save()<CR>]], desc = "Save" },
		{ "<leader>fS", [[<Cmd>lua require('user.utils').save_as()<CR>]], desc = "Save as" },
		{ "<leader>fw", [[<Cmd>w<CR>]], desc = "Save without formatting" },
		{ "<leader>fa", [[<Cmd>wa<CR>]], desc = "Save all" },
		{ "<leader>ff", [[<Cmd>lua require('conform').format()<CR>]], desc = "Format file" },
		{ "<leader>fl", [[<Cmd>lua vim.lsp.buf.lint()<CR>]], desc = "Lint file" },
		{ "<leader>fn", [[<Cmd>enew|setl bt=nofile<CR>]], desc = "New buffer" },
		{ "<leader>fv", [[<Cmd>NvimTreeFindFile<CR>]], desc = "View file in tree" },

		{ "<leader>nr", [[<Cmd>lua require("user.utils").reload_config()<CR>]], desc = "Reload config" },

		{ "<leader>vs", [[<Cmd>NvimTreeToggle<CR>]], desc = "Tree" },
		{ "<leader>vf", [[<Cmd>NvimTreeFindFile<CR>]], desc = "View file in tree" },

		{ "<leader>to", [[<Cmd>w|%bd|e#<CR>]], desc = "Close others" },

		{ "<leader>s", group = "select" },
		{ "<leader>sa", [[gg^VG$]], desc = "Select all" },
		{ "<leader>sA", [[mmgg^VG$y'm]], desc = "Select all and yank" },
		{ "<leader>sp", [["+p]], desc = "Paste from clipboard" },

		{ "<leader>c", group = "code" },
		{ "<leader>ca", [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], desc = "LSP actions" },
		{ "<leader>cr", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], desc = "LSP rename" },
		{ "<leader>cc", [[<Plug>(comment_toggle_linewise_current)]], desc = "Toggle comment" },

		{ "<leader>L", group = "lsp" },
		{ "<leader>Li", [[<Cmd>LspInfo<CR>]], desc = "LSP info" },
		{ "<leader>Lr", [[<Cmd>LspRestart<CR>]], desc = "LSP restart" },
		{ "<leader>Lm", [[<Cmd>Mason<CR>]], desc = "LSP Mason" },

		{ "<leader>q", group = "quit" },
		{ "<leader>qq", [[<Cmd>wqa<CR>]], desc = "Save and quit" },
		{ "<leader>qQ", [[<Cmd>qa!<CR>]], desc = "Quit without saving" },

		{ "<M-j>", ":m .+1<CR>==", desc = "Move line down" },
		{ "<M-k>", ":m .-2<CR>==", desc = "Move line up" },
	},
	{
		mode = { "x" },
		{ "<leader>cc", [[<Plug>(comment_toggle_linewise_visual)]], desc = "Toggle comment" },
		{ "<leader>sc", [["+y]], desc = "Yank to clipboard" },
		{ "<M-j>", [[:m '>+1<CR>gv=gv]], desc = "Move lines down" },
		{ "<M-k>", [[:m '<-2<CR>gv=gv]], desc = "Move lines up" },
	},
	{
		mode = { "i" },
		{ "<C-h>", "<C-w>", desc = "Delete word" },
	},
})
