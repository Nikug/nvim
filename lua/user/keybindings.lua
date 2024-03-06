local which_key = require("which-key")
vim.keymap.set("n", "<F1>", "<nop>")
vim.keymap.set("i", "<F1>", "<nop>")
vim.keymap.set("x", "<F1>", "<nop>")
vim.keymap.set("i", "<C-g>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- Normal mode
which_key.register({
	["<leader>"] = {
		["<leader>"] = {
			[[<Cmd>lua require("user.utils").search_files()<CR>]],
			"Search files",
		},
		b = { "<Cmd>Telescope buffers<CR>", "Search buffers" },
		a = { "<Cmd>Telescope find_files<CR>", "Search all files" },
		["/"] = { "<Cmd>Telescope live_grep<CR>", "Search text" },
		l = { "<Cmd>bn<CR>", "Next buffer" },
		h = { "<Cmd>bp<CR>", "Previous buffer" },

		f = {
			name = "File",
			s = { [[<Cmd>lua require('user.utils').save()<CR>]], "Save" },
			S = { [[<Cmd>lua require('user.utils').save_as()<CR>]], "Save as" },
			w = { "<Cmd>w<CR>", "Save without formatting" },
			a = { "<Cmd>wa<CR>", "Save all" },
			q = { "<Cmd>wq<CR>", "Save and close file" },
			Q = { "<Cmd>q!<CR>", "Close file without saving" },
			f = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format" },
			l = { "<Cmd>lua vim.lsp.buf.lint()<CR>", "Lint" },
			n = { [[<Cmd>enew|setl bt=nofile<CR>]], "New buffer" },
			N = { [[<Cmd>lua require('user.utils').new_file()<CR>]], "New file" },
			v = { "<Cmd>NvimTreeFindFile<CR>", "View" },
		},

		n = {
			name = "Neovim",
			r = { [[<Cmd>lua require("user.utils").reload_config()<CR>]], "Reload config" },
		},

		v = {
			name = "View",
			s = { "<Cmd>NvimTreeToggle<CR>", "Tree" },
			f = { "<Cmd>NvimTreeFindFile<CR>", "File" },
		},

		t = {
			name = "Tab",
			o = { "<Cmd>w|%bd|e#<CR>", "Close others" },
			k = { [[<Cmd>q<CR>]], "Close" },
			K = { "<Cmd>q!<CR>", "Close without saving" },
		},

		w = {
			name = "Window",
			s = { "<C-w>s|<C-w>j", "Split horizontal" },
			v = { "<C-w>v|<C-w>l", "Split vertical" },
			K = { "<Cmd>q<CR>", "Close window" },
			j = { "<C-w>j", "Move down" },
			k = { "<C-w>k", "Move up" },
			h = { "<C-w>h", "Move left" },
			l = { "<C-w>l", "Move right" },
			["="] = { "<C-w>=", "Equalize size" },
		},

		s = {
			name = "Select",
			a = { "gg^VG$", "All" },
			A = { [[mmgg^VG$y'm]], "All & yank" },
			p = { [["+p]], "Paste from clipboard" },
		},

		c = {
			name = "Code",
			h = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			H = { "<Cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "Hover diagnostics" },
			a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
			d = { "<Cmd>Telescope lsp_definitions<CR>", "Definition" },
			i = { "<Cmd>Telescope lsp_implementations<CR>", "Implementation" },
			r = { "<Cmd>Telescope lsp_references<CR>", "References" },
			t = { "<Cmd>Telescope lsp_typedefs<CR>", "Type definition" },
			n = { [[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_next_usage()<CR>]], "Next" },
			N = {
				[[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_previous_usage()<CR>]],
				"Previous",
			},
			R = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
			c = { "<Plug>(comment_toggle_linewise_current)", "Toggle comment" },
			e = { "<Cmd>lua vim.diagnostic.goto_next()<CR>", "Next error" },
			E = { "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous error" },
			f = { "za", "Toggle fold" },
		},

		L = {
			name = "LSP",
			i = { "<Cmd>LspInfo<CR>", "Info" },
			r = { "<Cmd>LspRestart<CR>", "Restart" },
			m = { "<Cmd>Mason<CR>", "Mason" },
		},

		o = {
			name = "Open",
			f = { "<Cmd>Telescope find_files<CR>", "File" },
			F = { [[<Cmd>lua require('user.utils').set_working_directory()<CR>]], "Folder" },
		},

		q = {
			name = "Quit",
			q = { "<Cmd>wqa<CR>", "Save & Quit" },
			Q = { "<Cmd>qa!<CR>", "Quit without saving" },
		},

		g = {
			name = "Git",
			g = { "<Cmd>G<CR>", "Git" },
		},

		p = { "<Cmd>YankyRingHistory<CR>", "Paste from history" },
	},

	["<M-j>"] = { ":m .+1<CR>==", "Move lines down" },
	["<M-k>"] = { ":m .-2<CR>==", "Move lines up" },
}, { mode = "n" })

-- Visual mode
which_key.register({
	["<M-j>"] = { [[:m '>+1<CR>gv=gv]], "Move lines down" },
	["<M-k>"] = { [[:m '<-2<CR>gv=gv]], "Move lines down" },
	["<leader>"] = {
		c = {
			name = "Code",
			c = { "<Plug>(comment_toggle_linewise_visual)", "Toggle comment" },
		},
		s = {
			name = "Select",
			c = { [["+y]], "Yank to clipboard" },
		},
	},
}, { mode = "x" })

-- Insert mode
which_key.register({
	["<C-h>"] = { "<C-w>", "Delete word" },
}, { mode = "i" })
