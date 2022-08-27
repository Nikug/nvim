-- Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

-- Key mapping
vim.g.mapleader = " "

-- Plugins (Packer)
require("plugins")

if vim.g.vscode then
  require("vscode")
else
  require("nvim")
end
