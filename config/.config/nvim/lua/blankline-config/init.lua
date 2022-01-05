vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype = { 'html', 'css', 'javascript', 'typescript', 'lua' }

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#4d4769 gui=nocombine]]

require('indent_blankline').setup {
  buftype_exclude = { 'terminal' },
  char_highlight_list = {
    'IndentBlanklineIndent1',
  },
}
