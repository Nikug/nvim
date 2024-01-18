local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"wbthomason/packer.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	"justinmk/vim-sneak",
	"tpope/vim-surround",
	"lbrayner/vim-rzip",
	"nvim-lua/plenary.nvim",
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { { "nvim-lua/plenary.nvim" } } },
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({ mappings = false })
		end,
	},
	"dcampos/nvim-snippy",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"dcampos/cmp-snippy",
		},
	},
	{ "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- LSP
	"williamboman/mason.nvim",
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},
	"neovim/nvim-lspconfig",
	{ "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",

	-- Git
	{ "tpope/vim-fugitive" },
})
