local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp_config.gdscript.setup({
	cmd = { "ncat", "localhost", "6005" },
})

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		-- Default handler
		function(server_name)
			lsp_config[server_name].setup({})
		end,

		-- Custom handlers
		rust_analyzer = function()
			lsp_config.rust_analyzer.setup({})
		end,

		lua_ls = function()
			lsp_config.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,

		volar = function()
			lsp_config.volar.setup({
				filetypes = { "vue" },
			})
		end,

		omnisharp = function()
			lsp_config.omnisharp.setup({
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
		end,
	},
})

local prettier = { "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		javascriptreact = prettier,
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})
