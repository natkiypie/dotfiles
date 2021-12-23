vim.cmd [[
  augroup set_nonumber
    autocmd!
    autocmd TermOpen * set nonumber | set norelativenumber
  augroup END

  augroup buffer_start_insert
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
  augroup END

  augroup open_start_insert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]]
