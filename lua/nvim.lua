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
vim.cmd [[colorscheme tokyonight]]

-- Setup plugins
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true
  }
})
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
require('lsp-config').setup()
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'vim', 'html', 'javascript', 'typescript', 'vue' },
  auto_install = true,
  highlight = {
    enable = true
  },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = { enable = true },
  }
})
require('snippy').setup({
  mappings = {
    is = {
      ['<Tab>'] = 'expand_or_advance',
      ['<S-Tab>'] = 'previous',
    }
  }
})
require('cmp-config').setup()

local which_key = require('which-key')
-- Normal mode
which_key.register({
  ['<leader>'] = {
    ['<leader>'] = { '<Cmd>FzfLua git_files<CR>', 'Search files' },
    b = { '<Cmd>FzfLua buffers<CR>', 'Search buffers' },
    ['/'] = { '<Cmd>FzfLua live_grep<CR>', 'Search text' },


    ['<C-p>'] = { '<Plug>yankstack_substitute_older_paste', 'Paste older' },
    ['<C-P>'] = { '<Plug>yankstack_substitute_newer_paste', 'Paste newer' },

    l = { '<Cmd>bn<CR>', 'Next buffer' },
    h = { '<Cmd>bp<CR>', 'Previous buffer' },

    f = {
      name = 'File',
      s = { [[<Cmd>lua require('utils').save()<CR>]], 'Save' },
      S = { [[<Cmd>lua require('utils').save_as()<CR>]], 'Save as' },
      w = { '<Cmd>w<CR>', 'Save without formatting' },
      a = { '', 'Save all' },
      q = { '<Cmd>wq<CR>', 'Save and close file' },
      Q = { '<Cmd>q!<CR>', 'Close file without saving' },
      f = { '<Cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' },
      l = { '', 'Lint' },
      n = { [[<Cmd>enew<CR>]], 'New buffer' },
      N = { [[<Cmd>lua require('utils').new_file()<CR>]], 'New file' },
      v = { '<Cmd>NvimTreeFindFile<CR>', 'View' },
    },

    n = {
      name = 'Neovim',
      l = { '<Cmd>luafile $VIMRC/init.lua<CR>', 'Reload init.lua' }
    },

    v = {
      name = 'View',
      s = { '<Cmd>NvimTreeToggle<CR>', 'Tree' },
      f = { '<Cmd>NvimTreeFindFile<CR>', 'File' },
    },

    t = {
      name = 'Tab',
      o = { '<Cmd>w|%bd|e#<CR>', 'Close others' },
      k = { '<Cmd>q<CR>', 'Close' },
      K = { '<Cmd>q!<CR>', 'Close without saving' },
    },

    w = {
      name = 'Window',
      s = { '<C-w>s|<C-w>j', 'Split horizontal' },
      v = { '<C-w>v|<C-w>l', 'Split vertical' },
      j = { '<C-w>j', 'Move down' },
      k = { '<C-w>k', 'Move up' },
      h = { '<C-w>h', 'Move left' },
      l = { '<C-w>l', 'Move right' },
      ['='] = { '<C-w>=', 'Equalize size' },
    },

    s = {
      name = 'Select',
      a = { 'gg^VG$', 'All' },
      A = { [[mmgg^VG$y'm]], 'All & yank' },
      p = { [["+p]], 'Paste from clipboard' }
    },

    c = {
      name = 'Code',
      h = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
      a = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Actions' },
      d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
      i = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
      r = { '<Cmd>lua vim.lsp.buf.references()<CR>', 'References' },
      t = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Type definition' },
      n = { [[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_next_usage()<CR>]], 'Next' },
      N = { [[<Cmd>lua require('nvim-treesitter-refactor.navigation').goto_previous_usage()<CR>]], 'Previous' },
      R = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename symbol' },
      c = { '<Plug>(comment_toggle_linewise_current)', 'Toggle comment' },
      e = { '<Cmd>lua vim.diagnostic.goto_next()<CR>', 'Next error' },
      E = { '<Cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous error' },
    },

    L = {
      name = "LSP",
      i = { '<Cmd>LspInfo<CR>', 'Info' },
      r = { '<Cmd>LspRestart<CR>', 'Restart' },
      m = { '<Cmd>Mason<CR>', 'Mason' },
    }
  },

  ['<M-j>'] = { ':m .+1<CR>==', 'Move lines down' },
  ['<M-k>'] = { ':m .-2<CR>==', 'Move lines up' },
}, { mode = 'n' })

-- Visual mode
which_key.register({
  ['<M-j>'] = { [[:m '>+1<CR>gv=gv]], 'Move lines down' },
  ['<M-k>'] = { [[:m '<-2<CR>gv=gv]], 'Move lines down' },
  ['<leader>'] = {
    c = {
      name = 'Code',
      c = { '<Plug>(comment_toggle_linewise_visual)', 'Toggle comment' },
    },
    s = {
      name = 'Select',
      c = { [["+y]], 'Yank to clipboard' },
    },
  }
}, { mode = 'v' })
