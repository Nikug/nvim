require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls" },
	automatic_enable = true,
})

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- LSP Keybinds

local function csharp_lsp_keymaps(buf)
	vim.keymap.set(
		"n",
		"gd",
		"<cmd>:lua require('omnisharp_extended').lsp_definition()<cr>",
		{ buffer = buf, noremap = true }
	)
	vim.keymap.set(
		"n",
		"gi",
		"<cmd>:lua require('omnisharp_extended').lsp_implementation()<cr>",
		{ buffer = buf, noremap = true }
	)
	vim.keymap.set("n", "gr", function()
		require("omnisharp_extended").telescope_lsp_references()
	end, { buffer = buf, noremap = true })
	vim.keymap.set(
		"n",
		"gt",
		"<cmd>:lua require('omnisharp_extended').lsp_type_definition()<cr>",
		{ buffer = buf, noremap = true }
	)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client.name == "omnisharp" then
			csharp_lsp_keymaps(ev.buf)
		else
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = ev.buf })
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = ev.buf })
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = ev.buf })
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { buffer = ev.buf })
		end

		vim.keymap.set("n", "gK", "<cmd>:lua vim.diagnostic.open_float()<cr>", { buffer = ev.buf })
	end,
})

-- Custom lsp configurations
vim.lsp.config("gdscript", {
	pattern = { "gd", "gdscript", "gdscript3" },
	cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
	root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("volar", {
	filetypes = { "vue" },
})

vim.lsp.config("omnisharp", {
	settings = {
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = true,
			EnableDecompilationSupport = true,
		},
	},
})
