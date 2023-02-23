return require("packer").startup(function(use)
	-- General
	use("wbthomason/packer.nvim")
	use("justinmk/vim-sneak")
	use("tpope/vim-surround")
	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({ ring = { history_length = 10 } })
		end,
	})

	-- Neovim only
	if not vim.g.vscode then
		use({ "folke/tokyonight.nvim", branch = "main" })
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, tag = "nightly" })
		use({ "junegunn/fzf", run = "./install --bin" })
		use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})
		use({
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({ mappings = false })
			end,
		})
		use({ "dcampos/nvim-snippy" })
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"dcampos/cmp-snippy",
			},
		})
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("user.startup-config").setup()
			end,
		})
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

		-- LSP
		use("williamboman/mason.nvim")
		use({ "williamboman/mason-lspconfig.nvim", requires = { "williamboman/mason.nvim" } })
		use("neovim/nvim-lspconfig")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
		use("nvim-treesitter/nvim-treesitter-refactor")

		-- Git
		use({ "tpope/vim-fugitive" })
	end
end)
