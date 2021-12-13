
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local utils = require'lsp-config/language-servers/utils'

local on_attach = function(client, bufnr)
  utils.commands()
  utils.keybindings(bufnr)
  utils.formatting(client)
end

require'lspconfig'['tsserver'].setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
    -- Highlight symbol under cursor: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#highlight-symbol-under-cursor
    if client.resolved_capabilities.document_highlight then
      vim.o.updatetime = 400
      vim.cmd [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
    end
  end,
  capabilities = capabilities,
}
