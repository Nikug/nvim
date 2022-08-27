local M = {}

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
local select_options = { behavior = cmp.SelectBehavior.Select }

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-space>'] = cmp.mapping.complete(),
      ['<tab>'] = cmp.mapping.confirm({ select = true }),
      ['<esc>'] = cmp.mapping.abort(),
      ['<up>'] = cmp.mapping.select_prev_item(select_options),
      ['<C-k>'] = cmp.mapping.select_prev_item(select_options),
      ['<down>'] = cmp.mapping.select_next_item(select_options),
      ['<C-j>'] = cmp.mapping.select_next_item(select_options),
    }),
    formatting = {
      fields = { 'menu', 'abbr', 'kind' }
    },
    sources = {
      cmp.config.sources({
        { name = 'snippy' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
      })
    }
  })
end

return M
