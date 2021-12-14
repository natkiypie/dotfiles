require 'lsp-config/cmp'
require 'lsp-config/language-servers/init'
require 'lsp-config/options'
require 'lsp-config/colors/init'

-- Show source in diagnostics: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-source-in-diagnostics
vim.diagnostic.config {
  virtual_text = {
    source = 'always',
  },
  float = {
    source = 'always',
  },
}
