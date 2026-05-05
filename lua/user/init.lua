vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.g.nocompatible = true

vim.opt.wrap = false
vim.opt.timeoutlen = 250

-- Clipboard fix for WSL
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --crlf",
			["*"] = "win32yank.exe -o --crlf",
		},
	}
end

require("user.plugins")

vim.cmd([[colorscheme nightfox]])
require("user.keybindings")
