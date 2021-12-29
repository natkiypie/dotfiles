vim.cmd [[
  augroup vim_enter
    autocmd!
    autocmd VimEnter * ++once lua require('utils.vim_enter').check_flag()
  augroup END
]]
