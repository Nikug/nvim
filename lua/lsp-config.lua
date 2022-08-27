local M = {}

local servers = {
  html = {},
  jsonls = {},
  pyright = {},
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  },
  tsserver = {},
  vimls = {},
  volar = {}
}

local function on_attach(client, buffer_number)
  vim.api.nvim_buf_set_option(buffer_number, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(buffer_number, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
end

local options = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  for server_name, _ in pairs(servers) do
    local opts = vim.tbl_deep_extend('force', options, servers[server_name])
    require('lspconfig')[server_name].setup(opts)
  end
end

return M
