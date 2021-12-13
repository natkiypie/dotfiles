local settings = require'lsp-config/language-servers/language_server_settings'
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local langservers = {
  'tsserver',
  'html',
  'cssls',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = settings.sumneko.cmd;
      settings = settings.sumneko.settings,
      on_attach = settings.sumneko.on_attach,
    }
  elseif server == 'tsserver' then
    require'lspconfig'[server].setup {
      on_attach = settings.typescript.on_attach,
      capabilities = capabilities,
    }
  else
    require'lspconfig'[server].setup {
      capabilities = capabilities,
    }
  end
end
