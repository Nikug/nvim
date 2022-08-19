" Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.nocompatible = true

" Key mapping
" nnoremap <SPACE> <Nop>
vim.opt.mapleader = " "
vim.opt.nottimeout = true
vim.opt.notimeout = true

if vim.g.vscode then
  require("vscode")
else 
  require("nvim")
end