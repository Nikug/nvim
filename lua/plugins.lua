return require('packer').startup(function(use)
  -- General
  use 'wbthomason/packer.nvim'
  use 'justinmk/vim-sneak'
  use 'maxbrunsfeld/vim-yankstack'
  use 'tpope/vim-surround'

  -- Neovim only
  if not vim.g.vscode then
    use { 'folke/tokyonight.nvim', branch = 'main'}
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      tag = 'nightly'
    }
    use { 'junegunn/fzf', run = './install --bin' }
    use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' }}
    use { 'folke/which-key.nvim', config = function() require('which-key').setup { } end }
  end
end)

