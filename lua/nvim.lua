-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

-- Setup theme
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

-- Setup tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true
  }
})

local wk = require('which-key')
wk.register({
  ['<leader>'] = { '<Cmd>FzfLua files<CR>', 'Search files' },
  b = { '<Cmd>FzfLua buffers<CR>', 'Search buffers' },
  ['/'] = { '<Cmd>FzfLua live_grep<CR>', 'Search text' },
  f = {
    name = 'File',
    s = { '<Cmd>w<CR>', 'Save file' },
    q = { '<Cmd>wq<CR>', 'Save and close file' },
    Q = { '<Cmd>q!<CR>', 'Close file without saving' },
  },
  n = {
    name = 'Neovim',
    l = {'<Cmd>luafile $VIMRC/init.lua<CR>', 'Reload init.lua' }
  },
  v = {
    name = 'View',
    s = {'<Cmd>NvimTreeToggle<CR>', 'Tree'},
    f = {'<Cmd>NvimTreeFindFile<CR>', 'File'},
  }
},
{ prefix = '<leader>' })
