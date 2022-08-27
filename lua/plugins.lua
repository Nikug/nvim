return require('packer').startup(function(use)
  -- General
  use 'wbthomason/packer.nvim'
  use 'justinmk/vim-sneak'
  use 'maxbrunsfeld/vim-yankstack'
  use 'tpope/vim-surround'

  -- Neovim only
  if not vim.g.vscode then
    use { 'folke/tokyonight.nvim', branch = 'main' }
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' }
    use { 'junegunn/fzf', run = './install --bin' }
    use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'folke/which-key.nvim', config = function() require('which-key').setup {} end }
    use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup({ mappings = false }) end }
    use { 'dcampos/nvim-snippy' }
    use { 'hrsh7th/nvim-cmp', requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'dcampos/nvim-snippy'
    },
      config = function() require('config.cmp') end
    }

    -- LSP
    use 'williamboman/mason.nvim'
    use { 'williamboman/mason-lspconfig.nvim', requires = { 'williamboman/mason.nvim' } }
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
  end
end)
