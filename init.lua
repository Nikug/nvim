-- Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

-- Key mapping
vim.g.mapleader = " "
vim.opt.ttimeout = false
vim.opt.timeout = false

if vim.g.vscode then
  require("vscode")
else 
  require("nvim")
end