local function add_user_commands(user_commands)
  for name, command in pairs(user_commands) do
    vim.api.nvim_add_user_command(name, function()
      command()
    end, { nargs = 0 })
  end
end

add_user_commands({
  LspRename = vim.lsp.buf.rename,
  LspRefs = vim.lsp.buf.references,
  LspDiag = vim.diagnostic.show,
  LspSignatureHelp = vim.lsp.buf.signature_help,
  LspImplementation = vim.lsp.buf.implementation,
  LspDef = vim.lsp.buf.definition,
  LspTypeDef = vim.lsp.buf.type_definition,
  LspFormatting = vim.lsp.buf.formatting,
  LspCodeAction = vim.lsp.buf.code_action,
  LspHover = vim.lsp.buf.hover,
})

vim.api.nvim_add_user_command('LspDiagLine', function()
  vim.diagnostic.open_float({border = 'single', focusable = false})
end, { nargs = 0 })
