local M = {}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

function M.bind(bufnr)
  buf_map(bufnr, 'n', '<Leader>d', ':LspDef<CR>')
  buf_map(bufnr, 'n', '<Leader>r', ':LspRef<CR>')
  buf_map(bufnr, 'n', '<Leader>e', ':LspRename<CR>')
  buf_map(bufnr, 'n', '<Leader>y', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', '<Leader>k', ':LspHover<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>l', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>z', ':LspRestart<CR>')
  buf_map(bufnr, 'i', '<C-s>', '<CMD>LspSignatureHelp<CR>')
end

function M.ts_bind(bufnr)
  buf_map(bufnr, 'n', '<Leader>o', ':TSLspOrganize<CR>')
  buf_map(bufnr, 'n', '<Leader>f', ':TSLspRenameFile<CR>')
  buf_map(bufnr, 'n', '<Leader>i', ':TSLspImportAll<CR>')
end

return M
