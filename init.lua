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

-- Plugins (Plugged)
vim.api.nvim_exec([[
""" Automatically load Plugged and install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'maxbrunsfeld/vim-yankstack'

call plug#end()

""" Plugin mappings
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
]], true)