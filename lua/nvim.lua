-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.timeoutlen = 250

-- Setup theme
vim.cmd([[colorscheme tokyonight-night]])

-- Setup plugins
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	filters = {
		dotfiles = true,
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = { "prettier", "eslint" },
})

require("lsp-config").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "vim", "html", "javascript", "typescript", "vue" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		navigation = { enable = true },
	},
})

require("snippy").setup({
	mappings = {
		is = {
			["<Tab>"] = "expand_or_advance",
			["<S-Tab>"] = "previous",
		},
	},
})

require("cmp-config").setup()
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})
