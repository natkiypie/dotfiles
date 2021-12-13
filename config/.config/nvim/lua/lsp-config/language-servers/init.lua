require'lsp-config/language-servers/sumneko_lua'
require'lsp-config/language-servers/typescript'

local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local general_langservers = {
  'html',
  'cssls',
}

for _, server in ipairs(general_langservers) do
  require'lspconfig'[server].setup {
    capabilities = capabilities,
  }
end
