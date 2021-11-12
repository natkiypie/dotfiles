-- Source: https://github.com/windwp/nvim-ts-autotag
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "lua", "html", "css", "javascript", "typescript" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  require'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    }
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
}
