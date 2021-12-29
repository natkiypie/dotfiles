vim.cmd [[
  augroup set_nonumber
    autocmd!
    autocmd TermOpen * set nonumber | set norelativenumber
  augroup END

  augroup reset_relnumber
    autocmd!
    autocmd TermLeave * set number | set relativenumber
  augroup END

  augroup buffer_start_insert
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
  augroup END

  augroup open_start_insert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END

  augroup unlist
    autocmd!
    autocmd TermOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif
  augroup END
]]
