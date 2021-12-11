local B = {}

B.buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

B.on_attach = function(client, bufnr)
    vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
    vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
    vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
    vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
    vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
    vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
    vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
    vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
    vim.cmd('command! LspDiag lua vim.diagnostic.show()')
    vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
    vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
    vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
    B.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
    B.buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
    B.buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
    B.buf_map(bufnr, 'n', '<Leader>k', ':LspHover<CR>')
    B.buf_map(bufnr, 'n', '[a', ':LspDiag<CR>')
    B.buf_map(bufnr, 'n', ']a', ':LspDiag<CR>')
    B.buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
    B.buf_map(bufnr, 'n', '<Leader>d', ':LspDiagLine<CR>')
    B.buf_map(bufnr, 'n', '<Leader>r', '<CMD>LspRestart<CR>')
    B.buf_map(bufnr, 'i', '<C-z>', '<CMD>LspSignatureHelp<CR>')
    if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

return B
