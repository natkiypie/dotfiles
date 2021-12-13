local M = {}

M.commands = function()
  local diagnostics_border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
  }
  vim.cmd[[
    command! LspDef lua vim.lsp.buf.definition()
    command! LspFormatting lua vim.lsp.buf.formatting()
    command! LspCodeAction lua vim.lsp.buf.code_action()
    command! LspHover lua vim.lsp.buf.hover()
    command! LspRename lua vim.lsp.buf.rename()
    command! LspRefs lua vim.lsp.buf.references()
    command! LspTypeDef lua vim.lsp.buf.type_definition()
    command! LspImplementation lua vim.lsp.buf.implementation()
    command! LspDiag lua vim.diagnostic.show()
    command! LspSignatureHelp lua vim.lsp.buf.signature_help()
  ]]
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float({border='..vim.inspect(diagnostics_border)..', focusable=false})')
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

M.keybindings = function(bufnr)
  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', 'gk', ':LspHover<CR>')
  buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', 'gl', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>r', ':LspRestart<CR>')
  buf_map(bufnr, 'i', '<C-f>', '<CMD>LspSignatureHelp<CR>')
end

M.highlight = function(client)
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
end

M.formatting = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

return M
