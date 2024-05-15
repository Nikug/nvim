local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { buffer = bufnr })
end)

local function enable_formatting(client)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentFormattingRangeProvider = true
end

local function disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentFormattingRangeProvider = true
end

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		-- Default handler
		function(server_name)
			lsp_config[server_name].setup({
				on_init = disable_formatting,
			})
		end,

		-- Custom handlers
		rust_analyzer = function()
			lsp_config.rust_analyzer.setup({
				on_init = enable_formatting,
			})
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
				on_init = enable_formatting,
			})
		end,
	},
})

-- Might require change to none-ls in the future
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Formatters
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.ocamlformat,

		-- Diagnostics
		-- Code actions
	},
})
