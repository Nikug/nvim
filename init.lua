-- Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

-- Key mapping
vim.g.mapleader = " "
vim.g.nottimeout = true
vim.g.notimeout = true

if vim.g.vscode then
  require("vscode")
else 
  require("nvim")
end