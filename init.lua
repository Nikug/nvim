-- Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

-- Plugins (Packer)
require("user.plugins")

-- Key mapping
vim.g.mapleader = " "
if not vim.g.vscode then
	require("user.keybindings").setup()
end

-- Universal keybindings
require("user.default-keybindings").setup()

if vim.g.vscode then
	require("user.vscode")
else
	require("user.nvim")
end
