require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls" },
	automatic_enable = true,
})

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = ev.buf })
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = ev.buf })
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = ev.buf })
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { buffer = ev.buf })
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
			EnableAnalyzersSupport = false,
			EnableImportCompletion = true,
		},
	},
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").definition_handler,
		["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
	},
})
