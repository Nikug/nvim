require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "vim", "html", "javascript", "typescript", "ocaml" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		navigation = { enable = true },
	},
})
