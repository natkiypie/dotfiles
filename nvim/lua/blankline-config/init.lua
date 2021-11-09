vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup {
  char = "|",
  buftype_exclude = {"terminal"},
}
