local utils = require'lsp-config/language-servers/utils'
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  utils.commands()
  utils.keybindings(bufnr)
  utils.formatting(client)
  utils.highlight(client)
end

require'lspconfig'['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
