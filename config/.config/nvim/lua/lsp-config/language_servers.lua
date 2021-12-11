local capabilities = require'lsp-config/language_server_capabilities'

local langservers = {
  'html',
  'cssls',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = capabilities.sumneko.cmd;
      settings = capabilities.sumneko.settings
    }
  else
    require'lspconfig'[server].setup {
      capabilities = capabilities.general
    }
  end
end

