require 'lsp-config/cmp'
require 'lsp-config/language-servers'
require 'lsp-config/options'
require 'lsp-config/highlights'
vim.diagnostic.config {
  virtual_text = {
    source = 'always',
  },
  float = {
    source = 'always',
  },
}
