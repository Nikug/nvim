local M = {}

function M.setup()
	local which_key = require("which-key")
	-- Normal mode
	which_key.register({
		["<leader>"] = {
			["<leader>"] = {
				"<Cmd>lua require('fzf-lua').git_files({ cmd = 'git ls-files --exclude-standard --cached --others' })<CR>",
				"Search files",
			},
			b = { "<Cmd>FzfLua buffers<CR>", "Search buffers" },
			a = { "<Cmd>FzfLua files<CR>", "Search all files" },
			["/"] = {
				[[<Cmd>lua require("fzf-lua").live_grep({ cmd = "rg -g '!{.git,node_modules}/'" })<CR>]],
				"Search text",
			},
			l = { "<Cmd>bn<CR>", "Next buffer" },
			h = { "<Cmd>bp<CR>", "Previous buffer" },

			f = {
				name = "File",
				s = { [[<Cmd>lua require('utils').save()<CR>]], "Save" },
				S = { [[<Cmd>lua require('utils').save_as()<CR>]], "Save as" },
				w = { "<Cmd>w<CR>", "Save without formatting" },
				a = { "<Cmd>wa<CR>", "Save all" },
				q = { "<Cmd>wq<CR>", "Save and close file" },
				Q = { "<Cmd>q!<CR>", "Close file without saving" },
				f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
				l = { "<Cmd>lua vim.lsp.buf.lint()<CR>", "Lint" },
				n = { [[<Cmd>enew<CR>]], "New buffer" },
				N = { [[<Cmd>lua require('utils').new_file()<CR>]], "New file" },
				v = { "<Cmd>NvimTreeFindFile<CR>", "View" },
			},

			n = {
				name = "Neovim",
				l = { "<Cmd>luafile $VIMRC/init.lua<CR>", "Reload init.lua" },
			},

			v = {
				name = "View",
				s = { "<Cmd>NvimTreeToggle<CR>", "Tree" },
				f = { "<Cmd>NvimTreeFindFile<CR>", "File" },
			},

			t = {
				name = "Tab",
				o = { "<Cmd>w|%bd|e#<CR>", "Close others" },
				k = { "<Cmd>bd<CR>", "Close" },
				K = { "<Cmd>bd!<CR>", "Close without saving" },
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
				a = { "<Cmd>FzfLua lsp_code_actions<CR>", "Actions" },
				d = { "<Cmd>FzfLua lsp_definitions<CR>", "Definition" },
				i = { "<Cmd>FzfLua lsp_implementations<CR>", "Implementation" },
				r = { "<Cmd>FzfLua lsp_references<CR>", "References" },
				t = { "<Cmd>FzfLua lsp_typedefs<CR>", "Type definition" },
				s = {
					"<Cmd>lua require('fzf-lua').lsp_live_workspace_symbols({ file_ignore_patterns={ 'node_modules' }})<CR>",
					"Symbols",
				},
				n = { [[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_next_usage()<CR>]], "Next" },
				N = {
					[[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_previous_usage()<CR>]],
					"Previous",
				},
				R = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
				c = { "<Plug>(comment_toggle_linewise_current)", "Toggle comment" },
				e = { "<Cmd>lua vim.diagnostic.goto_next()<CR>", "Next error" },
				E = { "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous error" },
			},

			L = {
				name = "LSP",
				i = { "<Cmd>LspInfo<CR>", "Info" },
				r = { "<Cmd>LspRestart<CR>", "Restart" },
				m = { "<Cmd>Mason<CR>", "Mason" },
			},

			o = {
				name = "Open",
				f = { "<Cmd>FzfLua files<CR>", "File" },
				F = { [[<Cmd>lua require('utils').set_working_directory()<CR>]], "Folder" },
			},

			q = {
				name = "Quit",
				q = { "<Cmd>wqa<CR>", "Save & Quit" },
				Q = { "<Cmd>qa!<CR>", "Quit without saving" },
			},

			g = {
				name = "Git",
				g = { "<Cmd>Neogit<CR>", "Git" },
			},
		},

		["<M-j>"] = { ":m .+1<CR>==", "Move lines down" },
		["<M-k>"] = { ":m .-2<CR>==", "Move lines up" },
		["<C-p>"] = { "<Plug>yankstack_substitute_older_paste<CR>", "Paste older" },
		["<C-P>"] = { "<Plug>yankstack_substitute_newer_paste<CR>", "Paste newer" },
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
end

return M
