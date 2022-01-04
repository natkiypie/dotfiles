local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {capabilities = capabilities}
  if server.name == 'tsserver' then
    opts = vim.tbl_deep_extend("force", {
      on_attach = require('lsp-config/utils').on_attach_typescript
    }, opts)
  elseif server.name == 'html' then
    opts = vim.tbl_deep_extend("force", {
      on_attach = require('lsp-config/utils').on_attach_html
    }, opts)
  elseif server.name == 'cssls' then
    opts = vim.tbl_deep_extend("force", {
      on_attach = require('lsp-config/utils').on_attach_css
    }, opts)
  end
  server:setup(opts)
end)
