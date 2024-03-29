local servers = {
	html = {},
	jsonls = {},
	pyright = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	tsserver = {},
	tailwindcss = {
		root_dir = require("lspconfig").util.root_pattern("tailwind.config.ts"),
	},
	-- unocss = { root_dir = require("lspconfig").util.root_pattern("uno.config.ts"), },
	vimls = {},
	volar = {
		filetypes = { "vue" },
	},
	eslint = {},
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

local function setup()
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
			null_ls.builtins.formatting.ocamlformat,
			-- Diagnostics
			-- Code actions
		},
	})
end

setup()
