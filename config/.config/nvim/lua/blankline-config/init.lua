vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype={'html', 'css', 'javascript', 'typescript', 'lua'}

require("indent_blankline").setup {
  char = "|",
  buftype_exclude = {"terminal"},
}
