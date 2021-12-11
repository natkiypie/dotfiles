require'null-ls'.config {}

local capabilities = require'lsp-config/language_server_capabilities'

local langservers = {
  'tsserver',
  'null-ls',
  'html',
  'cssls',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = capabilities.sumneko.cmd;
      settings = capabilities.sumneko.settings,
      on_attach = capabilities.sumneko.on_attach
    }
  elseif server == 'tsserver' then
    require'lspconfig'[server].setup {
      on_attach = capabilities.typescript.on_attach
    }
  elseif server == 'null-ls' then
    require'lspconfig'[server].setup {
      on_attach = capabilities.null_ls.on_attach
    }
  else
    require'lspconfig'[server].setup {
      capabilities = capabilities.general
    }
  end
end
