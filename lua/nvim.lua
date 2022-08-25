-- Basic settings
vim.wo.number = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.timeoutlen = 250

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
-- Normal mode
wk.register({
  ['<leader>'] = {
    ['<leader>'] = { '<Cmd>FzfLua files<CR>', 'Search files' },
    b = { '<Cmd>FzfLua buffers<CR>', 'Search buffers' },
    ['/'] = { '<Cmd>FzfLua live_grep<CR>', 'Search text' },

    ['<M-j>'] = { ':m .+1<CR>==', 'Move lines down' },
    ['<M-k>'] = { ':m .-2<CR>==', 'Move lines up' },

    ['<C-p>'] = { '<Plug>yankstack_substitute_older_paste', 'Paste older' },
    ['<C-P>'] = { '<Plug>yankstack_substitute_newer_paste', 'Paste newer' },

    l = { '<Cmd>bn<CR>', 'Next buffer' },
    h = { '<Cmd>bp<CR>', 'Previous buffer' },

    f = {
      name = 'File',
      s = { '<Cmd>w<CR>', 'Save' },
      S = { [[<Cmd>lua require('utils').save_as()<CR>]], 'Save as' },
      w = { '', 'Save without formatting' },
      a = { '', 'Save all' },
      q = { '<Cmd>wq<CR>', 'Save and close file' },
      Q = { '<Cmd>q!<CR>', 'Close file without saving' },
      f = { '', 'Format' },
      l = { '', 'Lint' },
      n = { '<Cmd>enew<CR>', 'New file' },
      v = {'<Cmd>NvimTreeFindFile<CR>', 'View'},
    },

    n = {
      name = 'Neovim',
      l = {'<Cmd>luafile $VIMRC/init.lua<CR>', 'Reload init.lua' }
    },

    v = {
      name = 'View',
      s = {'<Cmd>NvimTreeToggle<CR>', 'Tree'},
      f = {'<Cmd>NvimTreeFindFile<CR>', 'File'},
    },

    t = {
      name = 'Tab',
      o = {'<Cmd>w|%bd|e#<CR>', 'Close others'},
      k = {'<Cmd>q<CR>', 'Close'},
      K = {'<Cmd>q!<CR>', 'Close without saving'},
    },

    w = {
      name = 'Window',
      s = {'<C-w>s|<C-w>j', 'Split horizontal'},
      v = {'<C-w>v|<C-w>l', 'Split vertical'},
      j = {'<C-w>j', 'Move down'},
      k = {'<C-w>k', 'Move up'},
      h = {'<C-w>h', 'Move left'},
      l = {'<C-w>l', 'Move right'},
      ['='] = {'<C-w>=', 'Equalize size'},
    },

    s = {
      name = 'Select',
      a = { 'gg^VG$', 'All' },
      A = { [[mmgg^VG$y'm]], 'All & yank' },
      p = { [["+p]], 'Paste from clipboard' }
    },

    c = {
      name = 'Code',
      h = { '', 'Show documentation' },
      a = { '', 'Show actions' },
      d = { '', 'Definition' },
      i = { '', 'Implementation' },
      r = { '', 'References' },
      t = { '', 'Type definition' },
      n = { '', 'Next' },
      N = { '', 'previous' },
      R = { '', 'Rename symbol' },
      c = { '', 'Toggle comment' },
      e = { '', 'Next error' },
      E = { '', 'Previous error' },
    },
  },
}, { mode = 'n' })

-- Visual mode
wk.register({
  ['<M-j>'] = { [[:m '>+1<CR>gv=gv]], 'Move lines down' },
  ['<M-k>'] = { [[:m '<-2<CR>gv=gv]], 'Move lines down' },
  ['<leader>'] = {
    c = {
      name = 'Code',
      c = { '', 'Toggle comment' },
    },
    s = {
      name = 'Select',
      c = { [["+y]], 'Yank to clipboard' },
    },
  }
}, { mode = 'v' })
