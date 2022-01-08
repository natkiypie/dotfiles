local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand '~/.config/nvim/.stylua.toml' },
    },
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
        augroup null_ls_formatting_sync
          autocmd!
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
    end
  end,
}
