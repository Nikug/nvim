local M = {}

local servers = {
	html = {},
	jsonls = {},
	pyright = {},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	tsserver = {},
	tailwindcss = {},
	vimls = {},
	volar = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	},
}

local function on_attach(client)
	-- Disable formatting and use external formatter instead
	-- from Null-ls
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
	client.server_capabilities.documentFormattingProvider = false
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 250,
	},
	capabilities = capabilities,
}

function M.setup()
	for server_name, _ in pairs(servers) do
		local opts = vim.tbl_deep_extend("force", options, servers[server_name])
		require("lspconfig")[server_name].setup(opts)
	end

	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			-- Formatters
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.eslint_d,

			-- Diagnostics
			null_ls.builtins.diagnostics.eslint_d,

			-- Code actions
			null_ls.builtins.code_actions.eslint_d,
		},
	})
end

return M
