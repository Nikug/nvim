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
