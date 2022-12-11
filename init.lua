-- Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

-- Key mapping
vim.g.mapleader = " "
if not vim.g.vscode then
	require("user.keybindings").setup()
end

-- Plugins (Packer)
require("user.plugins")

-- Universal keybindings
require("user.default-keybindings").setup()

if vim.g.vscode then
	require("user.vscode")
else
	require("user.nvim")
end
