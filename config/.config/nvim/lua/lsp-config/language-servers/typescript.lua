local utils = require 'utils.language_servers'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'html',
  'cssls',
  'tsserver',
}

local on_attach_typescript = function(client, bufnr)
  utils.disable_native_formatting(client)
  utils.commands()
  utils.keybindings(bufnr)
  utils.highlight(client)
  utils.ts_utils(client, bufnr)
  utils.format(client)
end

local on_attach_html = function(client, bufnr)
  utils.disable_native_formatting(client)
  utils.commands()
  utils.keybindings(bufnr)
  utils.highlight(client)
  utils.format(client)
end

local on_attach_css = function(client, bufnr)
  utils.disable_native_formatting(client)
  utils.commands()
  utils.keybindings(bufnr)
  utils.format(client)
end

for _, server in ipairs(servers) do
  if server == 'tsserver' then
    require('lspconfig')[server].setup {
      on_attach = on_attach_typescript,
      capabilities = capabilities,
    }
  elseif server == 'html' then
    require('lspconfig')[server].setup {
      on_attach = on_attach_html,
      capabilities = capabilities,
    }
  elseif server == 'cssls' then
    require('lspconfig')[server].setup {
      on_attach = on_attach_css,
      capabilities = capabilities,
    }
  end
end
