vim.cmd [[
  augroup terminal_set_nonumber
    autocmd!
    autocmd TermOpen * set nonumber | set norelativenumber
  augroup END
]]
