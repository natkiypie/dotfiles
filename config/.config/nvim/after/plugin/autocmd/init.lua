vim.cmd [[
  augroup init
    autocmd!
    autocmd VimEnter * ++once lua require('utils.init').check_flag()
  augroup END
]]
