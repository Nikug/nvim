vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local select_options = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Esc>"] = cmp.mapping.abort(),
		["<Up>"] = cmp.mapping.select_prev_item(select_options),
		["<C-k>"] = cmp.mapping.select_prev_item(select_options),
		["<Down>"] = cmp.mapping.select_next_item(select_options),
		["<C-j>"] = cmp.mapping.select_next_item(select_options),
	}),
	formatting = {
		fields = { "menu", "abbr", "kind" },
	},
	sources = cmp.config.sources({
		{ name = "snippy" },
		{ name = "codeium" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
